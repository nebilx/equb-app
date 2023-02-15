import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:equb_app/Authentication/Models/usermodel.dart';
import 'package:equb_app/Authentication/Screens/signin.dart';
import 'package:equb_app/Authentication/Shared/Shared.dart';
import 'package:equb_app/Equb/Admin/Screens/ABottom.dart';
import 'package:equb_app/Equb/Finance/Screens/FBottom.dart';
import 'package:equb_app/Equb/User/Screens/UBottom.dart';
import 'package:equb_app/Equb/User/Screens/UHome.dart';
import 'package:equb_app/Reusables/dialogs.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:loading_progress/loading_progress.dart';

class Auth {
  login(String username, String password, BuildContext context) async {
    AndroidOptions _getAndriodOptions() =>
        const AndroidOptions(encryptedSharedPreferences: true);
    final storage = FlutterSecureStorage(aOptions: _getAndriodOptions());
    LoadingProgress.start(context);
    String url = '${dotenv.get('SERVER_URL')}auth/signIn';
    Dio dio = Dio();
    var data = FormData.fromMap({"username": username, "password": password});
    try {
      var response = await dio.post(url, data: data);
      LoadingProgress.stop(context);
      storage.write(key: 'token', value: response.data['accessToken']);

      role = response.data['role'];
      id = response.data['id'];
      fullname = response.data['fullname'];
      phone = response.data['phone'];
      image = response.data['image'];

      if (role == 'user') {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => UBottom()));
      } else if (role == 'admin') {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => ABottom()));
      } else if (role == 'finance') {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => FBottom()));
      }
    } on DioError catch (e) {
      LoadingProgress.stop(context);
      DecoratedDialogs.showError(e.response!.data, context, 'okay');
    }
  }

  signup(User user, BuildContext context) async {
    LoadingProgress.start(context);
    String url = '${dotenv.get('SERVER_URL')}auth/signUp';
    Dio dio = Dio();

    var data = FormData.fromMap({
      "fullname": user.fullname,
      "phone": user.phonenumber,
      "password": user.password,
      "username": user.username
    });

    try {
      var response = await dio.post(url, data: data);
      print(response.data);
      LoadingProgress.stop(context);
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => SignIn()));
    } on DioError catch (e) {
      LoadingProgress.stop(context);
      DecoratedDialogs.showError(e.response!.data, context, 'okay');
    }
  }
}

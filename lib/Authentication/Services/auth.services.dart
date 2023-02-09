import 'dart:math';

import 'package:dio/dio.dart';
import 'package:equb_app/Authentication/Models/usermodel.dart';
import 'package:equb_app/Reusables/dialogs.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:loading_progress/loading_progress.dart';

class Auth {
  login(String username, String password, BuildContext context) async {
    LoadingProgress.start(context);
    String url = '${dotenv.get('SERVER_URL')}auth/signIn';
    Dio dio = Dio();
    var data = FormData.fromMap({"username": username, "password": password});
    try {
      var response = await dio.post(url, data: data);

      print(response.data);
      LoadingProgress.stop(context);
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
    } on DioError catch (e) {
      LoadingProgress.stop(context);
      DecoratedDialogs.showError(e.response!.data, context, 'okay');
    }
  }
}

import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:dotenv/dotenv.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:loading_progress/loading_progress.dart';
import 'package:provider/provider.dart';

class Auth {
  login(String username, String password) async {
    String url = '${dotenv.get('SERVER_URL')}auth/signIn';
    Dio dio = Dio();
    var user = {"username": username, "password": password};
    try {
    
      var response = await dio.post(url, data: user);
    
    } on DioError catch (e) {
      print(e.response!.data);
    }
  }
}

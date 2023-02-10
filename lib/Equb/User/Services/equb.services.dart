import 'package:dio/dio.dart';
import 'package:equb_app/Equb/Models/UserEqub.Model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:loading_progress/loading_progress.dart';

import '../../../Authentication/Configuration/auth.config.dart';

class UserEqubServices with ChangeNotifier {
  List<EqubModeL> equbs = [];
  bool isLoading = true;

  getEqubs() async {
    String url = '${dotenv.get('SERVER_URL')}equb/getEqub';
    Dio dio = Dio();

    String token = (await storage.read(key: 'token'))!;
    try {
      var response = await dio.get(url,
          options: Options(headers: {'Authorization': 'Bearer $token'}));
      var data = response.data;
      equbs.clear();
      data.forEach((e) => {
            equbs.add(EqubModeL(
                title: e['title'],
                description: e['description'],
                amount: e['amount'].toString(),
                memberSize: e['memberSize'].toString()))
          });
      equbs.forEach((element) {
        print(element.title);
      });

      isLoading = false;
      notifyListeners();
    } on DioError catch (e) {
      print(e.response!.data);
    }
  }
}

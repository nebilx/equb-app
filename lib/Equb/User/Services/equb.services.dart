import 'package:dio/dio.dart';
import 'package:equb_app/Equb/Models/UserEqub.Model.dart';
import 'package:equb_app/Equb/User/Screens/UDetail.dart';
import 'package:equb_app/Reusables/dialogs.dart';
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
                id: e['_id'],
                title: e['title'],
                description: e['description'],
                amount: e['amount'].toString(),
                memberSize: e['memberSize'].toString(),
                members: e['members']))
          });

      isLoading = false;
      notifyListeners();
    } on DioError catch (e) {
      print(e.response!.data);
    }
  }

  joinEqub(EqubModeL equbModeL, String id, BuildContext context) async {
    LoadingProgress.start(context);
    String url = '${dotenv.get('SERVER_URL')}equb/joinEqub';
    Dio dio = Dio();

    String token = (await storage.read(key: 'token'))!;

    try {
      var response = await dio.patch(url,
          queryParameters: {"equbId": equbModeL.id, "id": id},
          options: Options(headers: {'Authorization': 'Bearer $token'}));
      LoadingProgress.stop(context);
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => UDetail(equbModeL: equbModeL)));
    } on DioError catch (e) {
      LoadingProgress.stop(context);
      DecoratedDialogs.showError(e.response!.data, context, 'okay');
    }
  }
}

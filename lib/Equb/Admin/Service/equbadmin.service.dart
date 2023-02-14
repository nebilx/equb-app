import 'package:dio/dio.dart';
import 'package:equb_app/Authentication/Configuration/auth.config.dart';
import 'package:equb_app/Equb/Admin/Screens/ABottom.dart';
import 'package:equb_app/Equb/Models/UserEqub.Model.dart';
import 'package:equb_app/Reusables/dialogs.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:loading_progress/loading_progress.dart';

class AdminEqubService with ChangeNotifier {
  List<EqubModeL> equbs = [];
  bool isLoading = true;
  bool isError = false;
  addEqub(EqubModeL equbModeL, BuildContext context) async {
    LoadingProgress.start(context);
    String uri = '${dotenv.get('SERVER_URL')}equb/createEqub';
    Dio dio = Dio();
    FormData data = FormData.fromMap(equbModeL.toMap(equbModeL));
    String token = (await (storage.read(key: 'token')))!;
    try {
      var response = await dio.post(
        uri,
        data: data,
        options: Options(headers: {"Authorization": "Bearer $token"}),
      );
      LoadingProgress.stop(context);
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => ABottom()));
    } on DioError catch (e) {
      LoadingProgress.stop(context);
      DecoratedDialogs.showError(e.message, context, 'okay');
    }
  }

  getEqub() async {
    String url = '${dotenv.get('SERVER_URL')}admin/getEqub';
    Dio dio = Dio();

    String token = (await storage.read(key: 'token'))!;
    try {
      var response = await dio.get(url,
          options: Options(headers: {'Authorization': 'Bearer $token'}));
      var data = response.data;
      equbs.clear();
      data.forEach((e) => {
            equbs.add(
              EqubModeL(
                  id: e['_id'],
                  title: e['title'],
                  description: e['description'],
                  amount: e['amount'].toString(),
                  memberSize: e['memberSize'].toString(),
                  members: e['members'],
                  winners: e['winners'],
                  roundMembers: e['roundMembers']),
            )
          });

      isLoading = false;
      notifyListeners();
    } on DioError catch (e) {
      isLoading = false;
      isError = true;
      notifyListeners();
    }
  }

  declareWinner(String equbId, String id, BuildContext context, int amount,
      String winnerName, List<dynamic> participants) async {
    String url = '${dotenv.get('SERVER_URL')}equb/declareWinner';
    Dio dio = Dio();

    String token = (await storage.read(key: 'token'))!;
    try {
      var response = await dio.patch(url,
          queryParameters: {"equbId": equbId, "id": id},
          options: Options(headers: {"Authorization": "Bearer $token"}));

      DecoratedDialogs.showSuccess(response.data['message'], context, 'okay');
    } on DioError catch (e) {
      DecoratedDialogs.showError(e.response!.data['message'], context, 'okay');
      return;
    }
    LoadingProgress.start(context);
    String messageUrl = '${dotenv.get('SERVER_URL')}equb/sendMessage';
    try {
      var formData = {
        "equbId": equbId,
        "participants": participants,
        "winner": winnerName,
        "amount": amount
      };
      var response = await dio.post(messageUrl,
          data: formData,
          options: Options(headers: {"Authorization": "Bearer $token"}));
      LoadingProgress.stop(context);
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => ABottom()));
    } on DioError catch (e) {
      LoadingProgress.stop(context);
      DecoratedDialogs.showError(e.response!.data['message'], context, 'ok');
    }
  }

  clearEqub(String id, BuildContext context) async {
    String url = '${dotenv.get('SERVER_URL')}equb/clear';
    Dio dio = Dio();

    String token = (await storage.read(key: 'token'))!;
    try {
      var response = await dio.patch(url,
          options: Options(headers: {"Authorization": "Bearer $token"}),
          queryParameters: {
            "equbId": id,
          });
      DecoratedDialogs.showSuccess('success', context, 'okay');
    } on DioError catch (e) {
      DecoratedDialogs.showError('Error occured', context, 'ok');
    }
  }
}

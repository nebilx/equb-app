import 'package:dio/dio.dart';
import 'package:equb_app/Equb/Finance/Models/message.models.dart';
import 'package:equb_app/Reusables/dialogs.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import '../../../Authentication/Configuration/auth.config.dart';

class MessageService with ChangeNotifier {
  bool isLoaidng = true;
  bool isError = false;
  List<MessageModel> messages = [];
  getMessages(BuildContext context) async {
    String url = '${dotenv.get('SERVER_URL')}message/';
    Dio dio = Dio();

    String token = (await storage.read(key: 'token'))!;
    try {
      var response = await dio.get(url,
          options: Options(headers: {"Authorization": "Bearer $token"}));
      var data = response.data;
      print(data);

      data.forEach((data) => {
            messages.add(MessageModel(
                title: data['title'],
                description: data['description'],
                winner: data['winner'],
                amount: data['amount'],
                date: data['date'],
                participants: data['participants']))
          });
      isLoaidng = false;
      notifyListeners();
    } on DioError catch (e) {
      isLoaidng = false;
      isError = true;
      notifyListeners();
      DecoratedDialogs.showError(e.response!.data, context, 'okay');
    }
  }
}

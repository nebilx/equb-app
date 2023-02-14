import 'package:dio/dio.dart';
import 'package:equb_app/Equb/Finance/Models/message.models.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import '../../../Authentication/Configuration/auth.config.dart';

class MessageService with ChangeNotifier {
  bool isLoaidng = true;
  bool isError = false;
  List<MessageModel> messages = [];
  getMessages() async {
    String url = '${dotenv.get('SERVER_URL')}message';
    Dio dio = Dio();

    String token = (await storage.read(key: 'token'))!;
    var response = await dio.get(url, options: Options(headers: {"Authorization":"Bearer $token"}));
    
  }
}

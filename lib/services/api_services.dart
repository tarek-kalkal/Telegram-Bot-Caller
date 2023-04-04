import 'dart:async';
import 'dart:developer';
import 'package:dio/dio.dart';
import '../models/bot_reponse.dart';

class ApiServices {
  Future<BotResponse?> getMessages() async {
    final dio = Dio();

    try {
      // 404
      final response = await dio.get(
          'https://api.telegram.org/bot6074261653:AAG5N9Q_R7QHP1eCk474m37vLrejBGYA9S4/getupdates');

      Map<String, dynamic> resu = response.data;
      if (resu["ok"] == true) {
        var returnValue = BotResponse.fromJson(resu);
        log(" the return value = " + returnValue.toString());
        return returnValue;
      }
    } on DioError catch (e) {
      if (e.response != null) {
        print(e.response.toString());
      } else {
        print(e.requestOptions);
        print(e.message);
      }
    }
  }
}

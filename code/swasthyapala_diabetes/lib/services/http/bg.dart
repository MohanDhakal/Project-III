import 'dart:convert';

import 'package:dio/dio.dart';

void sendBgValueToServer(int value) async {
  String baseUrl = "http://192.168.1.177:8000/api";

  BaseOptions options = new BaseOptions(
      baseUrl: baseUrl,
      receiveDataWhenStatusError: true,
      connectTimeout: 30 * 1000, // 30 seconds
      receiveTimeout: 30 * 1000 // 30 seconds
      );

  var data = {'userId': 1};
  try {
    Response user = await Dio(options)
        .get("/getPatient", queryParameters: {'phone': '9862790734'});
    var id = json.decode(user.data)['id'];
    Map<String, dynamic> map = {'userId': id, 'value': value};
    Response response = await Dio(options).post("/addBg", data: map);
    print(response);
  } on DioError catch (ex) {
    if (ex.type == DioErrorType.connectTimeout) {
      throw Exception("Connection  Timeout Exception");
    } else if (ex.type == DioErrorType.receiveTimeout) {
      throw Exception("receive  Timeout Exception");
    } else if (ex.type == DioErrorType.sendTimeout) {
      throw Exception("send  Timeout Exception");
    }
    throw Exception(ex.message);
  }
}

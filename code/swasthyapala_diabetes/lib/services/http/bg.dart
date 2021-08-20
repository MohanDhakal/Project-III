import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:swasthyapala_diabetes/services/shared_pref/session.dart';

String baseUrl = "http://192.168.1.177:8000/api";

BaseOptions options = new BaseOptions(
    baseUrl: baseUrl,
    receiveDataWhenStatusError: true,
    connectTimeout: 30 * 1000, // 30 seconds
    receiveTimeout: 30 * 1000 // 30 seconds
    );

void sendBgValueToServer(int value) async {
  int userId = await getID();
  try {
    Map<String, dynamic> map = {'userId': userId, 'value': value};
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

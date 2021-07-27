import 'dart:convert';

import 'package:dio/dio.dart';

Future<List> getMeals($userId) async {
  String baseUrl = "http://192.168.1.177:8000";

  BaseOptions options = new BaseOptions(
      baseUrl: baseUrl,
      receiveDataWhenStatusError: true,
      connectTimeout: 30 * 1000, // 30 seconds
      receiveTimeout: 30 * 1000 // 30 seconds
      );
  var jsonr;
  try {
    Response response = await Dio(options)
        .get("/api/getMeal", queryParameters: {'userId': $userId});
    jsonr = json.decode(response.data);
    jsonr.forEach((element) {
      print(element['id']);
    });
    // print(jsonr);
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
  return jsonr;
}

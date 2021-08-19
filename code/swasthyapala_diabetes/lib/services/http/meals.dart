import 'dart:convert';

import 'package:dio/dio.dart';
String baseUrl = "http://192.168.1.177:8000";

BaseOptions options = new BaseOptions(
    baseUrl: baseUrl,
    receiveDataWhenStatusError: true,
    connectTimeout: 30 * 1000, // 30 seconds
    receiveTimeout: 30 * 1000 // 30 seconds
);

Future<List> getMeals($userId) async {
//TODO: for testing only remove later
  $userId=1;

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

Future<String> getMeals1($userId) async {
//TODO: for testing only remove later
  $userId=1;

  var jsonr;
  try {
    Response response = await Dio(options)
        .get("/api/getMeal", queryParameters: {'userId': $userId});
    jsonr = response.data;
    // jsonr = json.decode(response.data);
    // jsonr.forEach((element) {
    //   print(element['id']);
    // });
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

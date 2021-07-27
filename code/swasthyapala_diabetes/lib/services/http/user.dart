import 'dart:convert';
import 'package:dio/dio.dart';

Future<void> addUser(String name, String phone) async {
  String baseUrl = "http://192.168.1.177:8000/api";

  BaseOptions options = new BaseOptions(
      baseUrl: baseUrl,
      receiveDataWhenStatusError: true,
      connectTimeout: 30 * 1000, // 30 seconds
      receiveTimeout: 30 * 1000 // 30 seconds
      );
  var jsonr;
  try {
    Response response = await Dio(options)
        .post("/addMeal", data: {'name': name, 'phone': phone});
    jsonr = json.decode(response.data);
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

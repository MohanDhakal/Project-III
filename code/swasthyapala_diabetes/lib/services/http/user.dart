import 'dart:convert';
import 'package:dio/dio.dart';
String baseUrl = "http://192.168.1.177:8000/api";

BaseOptions options = new BaseOptions(
    baseUrl: baseUrl,
    receiveDataWhenStatusError: true,
    connectTimeout: 30 * 1000, // 30 seconds
    receiveTimeout: 30 * 1000 // 30 seconds
);

Future<int> addUser(String name, String phone) async {
  var userId=1;
  try {
    Response response = await Dio(options)
        .post("/addPatient", data: {'name': name, 'phone': phone});
    var user = json.decode(response.data);
    userId=user['id'];
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
  return userId;
}
Future<bool> getUser(String phone)async{
  bool status=true;
  try {
    Response response = await Dio(options)
        .get("/getPatient", queryParameters: {'phone': phone});

    if(response.data['status']==false){
      status=false;
    }
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
return status;
}
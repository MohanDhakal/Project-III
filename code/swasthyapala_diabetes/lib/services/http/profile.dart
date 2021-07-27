import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:swasthyapala_diabetes/models/survey.dart';
import 'package:swasthyapala_diabetes/services/shared_pref/session.dart';

void addUserProfile(UserDetail userDetail) async {
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
    var decodedUser = json.decode(user.data);
    var oldMap = userDetail.toMap();
    oldMap.addAll(data);
    print(oldMap);
    Response response = await Dio(options).post("/addProfile", data: oldMap);
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

import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:swasthyapala_diabetes/models/survey.dart';
import 'package:swasthyapala_diabetes/services/shared_pref/session.dart';

String baseUrl = "http://192.168.1.177:8000/api";

BaseOptions options = new BaseOptions(
    baseUrl: baseUrl,
    receiveDataWhenStatusError: true,
    connectTimeout: 30 * 1000, // 30 seconds
    receiveTimeout: 30 * 1000 // 30 seconds
    );

void addUserProfile(UserDetail userDetail) async {

  int id = await getID();
  List<String> phoneName = await getSessionPhoneAndName();
  String phone = phoneName.elementAt(0);

  var data = {'userId': id};
  try {
    var oldMap = userDetail.toMap();
    oldMap.addAll(data);
    print("New map:$oldMap");
    Response response = await Dio(options).post("/addProfile", data: oldMap);
    print("response: ${response.data}");

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

Future<Map<String, dynamic>> getUserProfile() async {
  Map<String, dynamic> profile;
  int userId = await getID();

  try {
    Response userProfile = await Dio(options)
        .get("/getProfile", queryParameters: {'userId': userId});
    Map<String, dynamic> decodedUser = json.decode(userProfile.data);
    profile = decodedUser;
    print("In Service $decodedUser");
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
  return profile;
}

void updateAge(int age) async {
  int userId = await getID();

  try {
    Response userProfile = await Dio(options)
        .put("/updateAge", queryParameters: {'userId': userId, 'age': age});
    print(userProfile.data['status']);
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

void updateWeight(double weight) async {
  int userId = await getID();

  try {
    Response userProfile = await Dio(options).put("/updateWeight",
        queryParameters: {'userId': userId, 'weight': weight});
    print(userProfile.data['status']);
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

void updateHeight(double height) async {
  int userId = await getID();

  try {
    Response userProfile = await Dio(options).put("/updateHeight",
        queryParameters: {'userId': userId, 'height': height});
    print(userProfile.data['status']);
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

void updateActivity(String activity) async {
  int userId = await getID();

  try {
    Response userProfile = await Dio(options).put("/updateActivity",
        queryParameters: {'userId': userId, 'activity': activity});
    print(userProfile.data['status']);
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

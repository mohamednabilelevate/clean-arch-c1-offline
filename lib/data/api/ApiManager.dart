import 'dart:async';

import 'package:dio/dio.dart';
import 'package:elevate_online_exam_c1_offline/data/api/ApiConstants.dart';
import 'package:elevate_online_exam_c1_offline/data/api/model/request/RegisterRequest.dart';
import 'package:elevate_online_exam_c1_offline/data/api/model/response/AuthResponse.dart';
import 'package:injectable/injectable.dart';

@singleton
class ApiManager{
  var _dio = Dio(BaseOptions(
    baseUrl: ApiConstants.baseUrl
  ));

  ApiManager(){
    _dio.interceptors.add(LogInterceptor(
      requestBody: true,
      responseBody: true,
      requestHeader: true,
      responseHeader: true,
      logPrint: (object) {
        print('api ::   $object');
      },
    ));
  }

  Future<AuthResponse> login(String email,String password) async{
      var apiCall = await _dio.post(ApiConstants.loginApi, data: {
            "email":email,
            "password":password
          });
      return AuthResponse.fromJson(apiCall.data);

  }

  Future<AuthResponse> register(RegisterRequest requestBody)async{
    var apiCall = await _dio.post(ApiConstants.registerApi, data: requestBody.toJson());
    return AuthResponse.fromJson(apiCall.data);
  }

}
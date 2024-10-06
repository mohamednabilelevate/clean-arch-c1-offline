
import 'dart:async';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:elevate_online_exam_c1_offline/domain/core/AppExceptions.dart';
import 'package:elevate_online_exam_c1_offline/domain/core/Result.dart';

Future <Result<T>> executeApi<T>( Future<Result<T>> Function() apiCall) async{
    try{
      var result = await apiCall.call() ;
      return result;
    }on DioException catch(ex){
      return Fail(ex);
    } on TimeoutException catch(ex){
      return Fail(NoInternetException());
    }on IOException catch(ex){
      return Fail(NoInternetException());
    }
  }


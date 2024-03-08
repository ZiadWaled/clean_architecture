import 'package:clean_architecture/app/constants.dart';
import 'package:clean_architecture/presentation/resources/constants_manager.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

const String APPLICATION_JSON = "application/json";
const String CONTENT_TYPE = "content-type";
const String ACCEPT = "accept";
const String AUTHORIZATION = "authorization";
const String DEFAULT_LANGUAGE = "language";

class DioFactory {
  Future<Dio> getDio() async {
    Dio dio = Dio();

    Duration timeout = const Duration(seconds: Constants.apiTimeOut);
    Map<String, String> headers = {
      CONTENT_TYPE: APPLICATION_JSON,
      ACCEPT: APPLICATION_JSON,
      AUTHORIZATION:Constants.token,
      DEFAULT_LANGUAGE: 'en', // todo get language from app prefs
    };
    dio.options = BaseOptions(
        baseUrl: Constants.baseUrl,
        headers: headers,
        receiveTimeout: timeout,
        sendTimeout: timeout);

    if(!kReleaseMode)
      {
        dio.interceptors.add(PrettyDioLogger(
          requestHeader : true,
          requestBody :true,
          responseHeader : true,
        ));
      }
      
    return dio;
  }
}

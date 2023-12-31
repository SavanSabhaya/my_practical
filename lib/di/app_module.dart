import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';
import 'injection_container.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

@module
abstract class AppModule {
  // @preResolve // if you need to  pre resolve the value
  // Future<SharedPreferences> get prefs => SharedPreferences.getInstance();

  @lazySingleton
  Dio get dio {
    final aDio = Dio(
      BaseOptions(
        baseUrl: "URL",
        connectTimeout: Duration(milliseconds: 6000),
        receiveTimeout: Duration(milliseconds: 6000),
        sendTimeout: Duration(milliseconds: 6000),
      ),
    );

    aDio.interceptors.add(PrettyDioLogger(
        requestHeader: true,
        requestBody: true,
        responseBody: true,
        responseHeader: false,
        error: true,
        compact: true,
        maxWidth: 90));
    return aDio;
  }
}

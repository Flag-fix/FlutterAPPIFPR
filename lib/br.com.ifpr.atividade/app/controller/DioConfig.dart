import 'dart:io';
import 'package:dio/adapter.dart';
import 'package:dio/dio.dart';

class DioConfig{

  static Dio builderConfig(){

      var dio = Dio(BaseOptions(
        baseUrl: "http://localhost:8080/api/",
        connectTimeout: 30*1000,
        receiveTimeout: 30*1000,)
      );

      // if (Platform.isAndroid) {
      //   (dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate =
      //       (client) {
      //     client.badCertificateCallback =      //         (X509Certificate cert, String host, int port) => true;
      //     return client;
      //   };
      // }

      return dio;
  }
}
import 'dart:convert';

import 'package:dio/dio.dart';
import 'dart:io';
import 'package:dio/adapter.dart';
import 'package:flutter_framework/models/index.dart';

class DioInstance {
  // 或者通过传递一个 `options`来创建dio实例
  BaseOptions options;
  Dio dio;
  String baseUrl = "http://localhost:8000";

  // String baseUrl = "https://www-test.cotroncloud.com/";
  DioInstance() {
    options = BaseOptions(
      baseUrl: baseUrl,
      connectTimeout: 5000,
      receiveTimeout: 3000,
    );
    dio = Dio(options);
    (dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate =
        (client) {
      client.findProxy = (uri) {
        return "PROXY 172.24.3.24:8888";
      };
      //代理工具会提供一个抓包的自签名证书，会通不过证书校验，所以我们禁用证书校验
      client.badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
    };

    dio.interceptors
        .add(InterceptorsWrapper(onRequest: (RequestOptions options) async {
      // 在请求被发送之前做一些事情
      return options; //continue
      // 如果你想完成请求并返回一些自定义数据，可以返回一个`Response`对象或返回`dio.resolve(data)`。
      // 这样请求将会被终止，上层then会被调用，then中返回的数据将是你的自定义数据data.
      //
      // 如果你想终止请求并触发一个错误,你可以返回一个`DioError`对象，或返回`dio.reject(errMsg)`，
      // 这样请求将被中止并触发异常，上层catchError会被调用。
    }, onResponse: (data) async {
      // 在返回响应数据之前做一些预处理
      return data.data["data"]; // continue
    }, onError: (DioError e) async {
      // 当请求失败时做一些预处理
      return e; //continue
    }));
  }
}

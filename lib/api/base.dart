import 'apiConfig.dart';
import 'package:dio/dio.dart';

class Base extends DioInstance {
  getBookList () async {
    return dio.get("/api/base/baseKeyBook/list");
  }
}
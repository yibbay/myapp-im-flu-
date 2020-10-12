import 'apiConfig.dart';
import 'package:dio/dio.dart';

class User extends DioInstance {
  getBookList () async {
    return dio.get("/api/user/search");
  }
}
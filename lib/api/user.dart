import 'apiConfig.dart';
import 'package:dio/dio.dart';

class User extends DioInstance {
  getUserList (map) async {
    return dio.post("/api/user/search", data: map);
  }

  addUser (map) async {
    return dio.post("/api/user/add", data: map);
  }
}
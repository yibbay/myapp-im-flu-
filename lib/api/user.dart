import 'apiConfig.dart';

class User extends DioInstance {
  login (map) {
    return dio.post("/api/user/login", data: map);
  } 
  register (map) {
    return dio.post("/api/user/register", data: map);
  } 
  getUserList (map) {
    return dio.post("/api/user/search", data: map);
  }

  addUser (map) {
    return dio.post("/api/user/add", data: map);
  }
}
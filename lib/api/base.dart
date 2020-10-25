import 'apiConfig.dart';

class Base extends DioInstance {
  getBookList () async {
    return dio.get("/api/base/baseKeyBook/list");
  }
}
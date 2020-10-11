import 'apiConfig.dart';

class Zcts extends DioInstance {
  getPolicyList (Map <String, dynamic>map) {
    return dio.post("/api/zcts/zctsPolicy/list", data: map);
  }
}

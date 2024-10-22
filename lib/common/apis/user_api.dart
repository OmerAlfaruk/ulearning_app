import 'package:ulearning/common/entities/entities.dart';
import 'package:ulearning/common/util/http_util.dart';

class UserAPI {
  // Login method calling HttpUtil's post
  static Future<UserLoginResponseEntity> login({LoginRequestEntity? params}) async {
    try {
      var response = await HttpUtil().post(
        'api/login',
        queryParameter: params?.toJson(),
      );

      // Ensure the response is a Map<String, dynamic>
      if (response is Map<String, dynamic>) {
        return UserLoginResponseEntity.fromJson(response);
      } else if (response.data is Map<String, dynamic>) {
        return UserLoginResponseEntity.fromJson(response.data);
      } else {
        throw Exception('Unexpected response format');
      }
    } catch (e) {
      print('Login failed: $e');
      rethrow;
    }
  }
}
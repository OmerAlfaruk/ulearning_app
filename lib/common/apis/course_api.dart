import 'package:ulearning/common/entities/entities.dart';
import 'package:ulearning/common/util/http_util.dart';

class CourseApi {
  static Future<CourseListResponseEntity> courseList() async {
    var response = await HttpUtil().post('api/courseList');

    // Extract the data from the response.
    if (response.statusCode == 200) {  // Assuming response has statusCode.
      // Extract the JSON part of the response.
      var responseData = response.data; // `data` should hold the JSON body

      // Print the data for debugging purposes.
      print(responseData.toString());

      // Make sure the responseData is a valid JSON map.
      return CourseListResponseEntity.fromJson(responseData);
    } else {
      throw Exception('Failed to load course list, status code: ${response.statusCode}');
    }
  }
  static Future<CourseDetailResponseEntity> courseDetail({CourseRequestEntity? params}) async {
    var response = await HttpUtil().post('api/courseDetail',
    queryParameter: params?.toJson()
    );


    // Extract the data from the response.
    if (response.statusCode == 200) {
      var responseData = response.data;
      // Make sure the responseData is a valid JSON map.
      return CourseDetailResponseEntity.fromJson(responseData);
    } else {
      throw Exception('Failed to load course Detail, status code: ${response.statusCode}');
    }
  }
  // for course payment

static Future<BaseResponseEntity> coursePay({CourseRequestEntity? params}) async {
    var response=await HttpUtil().post(
      'api/checkout',
      queryParameter: params?.toJson(),
    );
    var responseData = response.data;
    return BaseResponseEntity.fromJson(responseData);
}
}

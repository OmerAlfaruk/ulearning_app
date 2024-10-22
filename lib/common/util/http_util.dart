import 'package:dio/dio.dart';
import 'package:ulearning/global.dart';

class HttpUtil {
  // Singleton instance of HttpUtil
  static final HttpUtil _instance = HttpUtil._internal();

  // Factory constructor for the singleton pattern
  factory HttpUtil() {
    return _instance;
  }

  late Dio dio;

  // Internal constructor for singleton initialization
  HttpUtil._internal() {
    // Initialize Dio with BaseOptions
    BaseOptions option = BaseOptions(
      baseUrl: "http://192.168.8.41:8000/",
      connectTimeout: const Duration(seconds: 20),
      receiveTimeout: const Duration(seconds: 20),
      headers: {},
      contentType: "application/json; charset=utf-8", // Fixed contentType syntax
      responseType: ResponseType.json,
    );

    // Assign the options to Dio
    dio = Dio(option);
  }

  // Post method for making HTTP requests
  Future post(String path, {dynamic data, Map<String, dynamic>? queryParameter, Options? options}) async {
    Options requestOptions= options??Options();
    requestOptions.headers=requestOptions.headers??{};
    Map<String,dynamic>? authorization=getAuthorizationHeader();
    if(authorization!=null){
      requestOptions.headers!.addAll(authorization);
    }
    var response = await dio.post(path, data: data, queryParameters: queryParameter,options: requestOptions);
    print("my response data is ${response.toString()}");
    print("my status code is ${response.statusCode.toString()}");
    return response;
  }
  Map<String,dynamic>? getAuthorizationHeader(){
    var headers=  <String,dynamic>{};
    var accessToken=Global.storageService.getUserToken();
    if(accessToken.isNotEmpty){
      headers['Authorization']='Bearer $accessToken';
    }
    return headers;
  }
}



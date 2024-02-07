import 'package:dio/dio.dart';
import 'package:get/get.dart';

class DioMiddleware extends GetConnect {
  Dio dio = Dio();

  DioMiddleware() {
    // Add interceptor for handling requests and responses
    dio.interceptors.add(InterceptorsWrapper(
      onRequest: (options, handler) {
        // Handle request interception
        // For example, you can add headers or modify the request here
        return handler.next(options); // Pass the request to the next interceptor
      },
      onResponse: (response, handler) {
        // Handle response interception
        // For example, you can parse the response data here
        return handler.next(response); // Pass the response to the next interceptor
      },
      onError: (DioError e, handler) {
        // Handle error interception
        // For example, you can handle different types of errors here
        return handler.next(e); // Pass the error to the next interceptor
      },
    ));
  }
}

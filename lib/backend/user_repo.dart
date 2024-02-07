import 'dart:io';

import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../Api/api_routes.dart';
import '../models/user_model.dart';
import 'middleware/dio_middleware.dart';

class UserRepo{
  Dio dio = Get.find<DioMiddleware>().dio;
  Future<void> deleteUser({required String adminId,required String userId}) async {
    try {
      String path = '${ApiRoutes.baseUrl}/$adminId';
      print(path);
      final response = await dio.delete(path,data: {'id':userId});
      if(response.statusCode == 200){
        print(response);
      }
      return response.data;
    } on DioException catch (e) {
      _handleError(e);
      rethrow;
    }
  }
  Future<void> updateUser({required String adminId,required dynamic data}) async {
    try {
      String path = '${ApiRoutes.baseUrl}/$adminId';
      print(path);
      final response = await dio.put(path,data: data);
      if(response.statusCode == 200){
        print(response);
      }
      return response.data;
    } on DioException catch (e) {
      _handleError(e);
      rethrow;
    }
  }
  Future<List<Data>> getAllUser({required String adminId}) async {
    try {
      String path = '${ApiRoutes.baseUrl}/${ApiRoutes.allUser}';
      // String path = 'http://localhost:3008/api/';
      print(path);
      final response = await dio.get(path);
      if (response.statusCode == 200) {
        print(response);
        List<dynamic> userDataList = response.data['data'];
        List<Data> userList = userDataList.map((userData) => Data.fromJson(userData)).toList();
        return userList;
      } else {
        throw Exception('Failed to load user data');
      }
    } on DioError catch (e) {
      _handleError(e);
      throw e;
    }
  }
  void _handleError(DioException e) {
    String errorMessage = 'Request failed';
    if (e.response != null) {
      errorMessage = '${e.response!.statusCode}: ${e.response!.statusMessage}';
    } else if (e.error is SocketException) {
      errorMessage = 'No internet connection';
    }
    print(errorMessage);
  }
}
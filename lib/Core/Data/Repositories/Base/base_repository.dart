import 'package:dio/dio.dart';

import '../../../Services/response_model.dart';

abstract class BaseRepository {
  final Dio _dio = Dio();

  Future<ResponseModel> getRequest(String url, {Map<String, dynamic>? queryParams, Options? options}) async {
    try {
      final response = await _dio.get(url, queryParameters: queryParams, options: options);
      return _parseResponse(response);
    } catch (e) {
      return ResponseModel.error("Error in GET request: $e");
    }
  }

  Future<ResponseModel> postRequest(String url, Map<String, dynamic> data, {Options? options}) async {
    try {
      final response = await _dio.post(url, data: data, options: options);
      if (response.statusCode == 200) {
        final dataJson = response.data as Map<String, dynamic>;
        return ResponseModel.completed(dataJson);
      } else {
        return ResponseModel.error('Request failed with status: ${response.statusCode}');
      }
    } catch (e) {
      return ResponseModel.error("Error occurred: $e");
    }
  }

  Future<ResponseModel> putRequest(String url, Map<String, dynamic> data, {Options? options}) async {
    try {
      final response = await _dio.put(url, data: data, options: options);
      return _parseResponse(response);
    } catch (e) {
      return ResponseModel.error("Error in PUT request: $e");
    }
  }

  Future<ResponseModel> deleteRequest(String url, {Map<String, dynamic>? queryParams, Options? options}) async {
    try {
      final response = await _dio.delete(url, queryParameters: queryParams, options: options);
      return _parseResponse(response);
    } catch (e) {
      return ResponseModel.error("Error in DELETE request: $e");
    }
  }

  ResponseModel _parseResponse(Response response) {
    if (response.statusCode == 200 && response.data != null) {
      final dataJson = response.data;
      if (dataJson['statusCode'] == 200) {
        return ResponseModel.completed(dataJson['data']);
      } else {
        return ResponseModel.error(dataJson['message']);
      }
    } else {
      return ResponseModel.error("Request failed: ${response.statusCode}");
    }
  }
}

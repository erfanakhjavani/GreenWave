import 'package:GreenWave/Core/Constants/address_key.dart';
import 'package:GreenWave/Core/Services/response_model.dart';
import 'package:dio/dio.dart';

class ImageRepository {
  final Dio _dio = Dio();

  Future<ResponseModel> uploadImages(Map<String, dynamic> data,) async {
    try {

      final response = await _dio.post(
        AddressKey.uploadImage,
        data: data,

      );

      if (response.statusCode == 200) {
      return  ResponseModel.completed(response);
      } else {
      return  ResponseModel.error("Failed to upload images: ${response.statusCode}");
      }
    } catch (e) {
     return ResponseModel.error("Error uploading images: $e");
    }
  }
}

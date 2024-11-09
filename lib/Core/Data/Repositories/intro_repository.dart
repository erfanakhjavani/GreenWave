import 'package:GreenWave/Core/Data/Repositories/data_repository.dart';
import 'package:dio/dio.dart';
import '../../../Core/Constants/address_key.dart';
import '../../../Core/Services/response_model.dart';
import '../../../Features/Intro/IntroMain/intro_main_model.dart';

class IntroRepository {
  final Dio dio = Dio();

  Future<ResponseModel> postPlatformData(int platformCode) async {
    Map<String, dynamic> data = {"platform": platformCode};

    try {
      var response = await dio
          .post(
        AddressKey.postPlatform,
        data: data,
      )
          .timeout(const Duration(seconds: 5));

      if (response.statusCode == 200) {
        var dataJson = response.data;
        var dataResponse = IntroMainModel(
          message: dataJson['message'],
          status: dataJson['statusCode'],
          data: dataJson['data'],
        );
        if (dataResponse.status == 200) {
          DataRepository().saveData('codeRD', dataResponse.data);
    return ResponseModel.completed(dataResponse);
        } else {
          return ResponseModel.error(dataResponse.message);
        }
      } else {
        return ResponseModel.error('Failed to post platform data');
      }
    } catch (e) {
      return ResponseModel.error('Error occurred: $e');
    }
  }
}

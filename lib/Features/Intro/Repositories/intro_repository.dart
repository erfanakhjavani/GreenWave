import 'package:GreenWave/Core/Constants/address_key.dart';
import 'package:GreenWave/Core/Data/Repositories/storage_repository.dart';
import 'package:GreenWave/Core/Services/response_model.dart';
import '../IntroMain/intro_main_model.dart';
import '../../../Core/Data/Repositories/base_repository.dart';
import 'package:dio/dio.dart';

class IntroRepository extends BaseRepository {
  Future<ResponseModel> postPlatformData(int platformCode) async {
    final data = {"platform": platformCode};

    final response = await postRequest(AddressKey.postPlatform, data);
    if (response.status == Status.COMPLETED && response.data != null) {
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
  }
}

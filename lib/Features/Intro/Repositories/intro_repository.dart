import 'package:GreenWave/Core/Constants/address_key.dart';
import 'package:GreenWave/Core/Data/Repositories/model_repository.dart';
import 'package:GreenWave/Core/Data/Repositories/storage_repository.dart';
import 'package:GreenWave/Core/Services/response_model.dart';
import 'package:GreenWave/Core/UI%20Helper/show_snack_bar.dart';

import '../../../Core/Data/Repositories/base_repository.dart';
import '../IntroMain/intro_main_model.dart';

class IntroRepository extends BaseRepository {
  Future<ResponseModel> postPlatformData(int platformCode) async {
    final data = {"platform": platformCode};

    final response = await postRequest(AddressKey.postPlatform, data)
        .timeout(const Duration(seconds: 10), onTimeout: () {
      return ResponseModel.error('TimeoutException...');
    });
    if (response.status == Status.COMPLETED && response.data != null) {
      var dataJson = response.data;
      var dataResponse = IntroMainModel(
        data: dataJson['data'],
      );
      var statusModel = ModelRepository(
        message: dataJson['message'],
        status: dataJson['statusCode'],
      );
      if (statusModel.status == 200) {
        DataRepository().saveData('codeRD', dataResponse.data);
        return ResponseModel.completed(dataResponse);
      } else {
        showCustomSnackBar('Error', statusModel.message);
        return ResponseModel.error(statusModel.message);
      }
    } else {
      showCustomSnackBar('Error', 'Failed to post platform data');
      return ResponseModel.error('Failed to post platform data');
    }
  }
}

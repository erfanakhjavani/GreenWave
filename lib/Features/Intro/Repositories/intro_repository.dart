import 'package:GreenWave/Core/Constants/address_key.dart';
import 'package:GreenWave/Core/Data/Repositories/storage_repository.dart';
import 'package:GreenWave/Core/Services/response_model.dart';
import 'package:GreenWave/Core/UIHelper/show_snack_bar.dart';

import '../../../Core/Data/Repositories/base_repository.dart';

class IntroRepository extends BaseRepository {
  Future<ResponseModel> postPlatformData(dynamic platformCode) async {
    final data = {"platform": platformCode};

    final response = await postRequest(AddressKey.postPlatform, data)
        .timeout(const Duration(seconds: 10), onTimeout: () {
      return ResponseModel.error('TimeoutException...');
    });
    if (response.status == Status.COMPLETED) {
        DataRepository().saveData(AddressKeyStorage.codeRD, response.data);
        return ResponseModel.completed(response.data);
    } else {
      showCustomSnackBar('Error', 'Failed to post platform data');
      return ResponseModel.error('Failed to post platform data');
    }
  }
}

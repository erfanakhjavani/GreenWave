import '../../../../Core/Constants/address_key.dart';
import '../../../../Core/Data/Repositories/base_repository.dart';
import '../../../../Core/Data/Repositories/model_repository.dart';
import '../../../../Core/Data/Repositories/storage_repository.dart';
import '../../../../Core/Services/response_model.dart';
import '../../../../Core/UI Helper/show_snack_bar.dart';

class MobileRepository extends BaseRepository {


  //! step 1: send phone Number
  Future<ResponseModel> sendPhoneNumber(Map<String, dynamic> data) async {
    return await postRequest(AddressKey.getUserAuth, data).timeout(const Duration(seconds: 10));
  }


  //! step 1: send phone Number
  Future<ResponseModel> enterPassword(Map<String, dynamic> data) async {
    final response = await postRequest(AddressKey.verifyPhoneNumberPassword, data)
        .timeout(const Duration(seconds: 10), onTimeout: () {
      return ResponseModel.error('TimeoutException...');
    });
    if (response.status == Status.COMPLETED && response.data != null) {
      var dataJson = response.data;
      var dataResponse = ModelRepository(
        message: dataJson['message'],
        status: dataJson['statusCode'],
        data: dataJson['data'],
      );
      if (dataResponse.status == 200) {
        DataRepository().saveData('codeRD', dataResponse.data);
        return ResponseModel.completed(dataResponse);
      } else {
        showCustomSnackBar('Error', dataResponse.message);
        return ResponseModel.error(dataResponse.message);
      }
    } else {
      showCustomSnackBar('Error', 'Failed to post platform data');
      return ResponseModel.error('Failed to post platform data');
    }
  }

}
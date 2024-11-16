import '../../../../Core/Constants/address_key.dart';
import '../../../../Core/Data/Repositories/base_repository.dart';
import '../../../../Core/Data/Repositories/storage_repository.dart';
import '../../../../Core/Services/response_model.dart';
import '../../../../Core/UIHelper/show_snack_bar.dart';

class MobileRepository extends BaseRepository {


  //! step 1: send phone Number
  Future<ResponseModel> sendPhoneNumber(Map<String, dynamic> data) async {
    final response = await postRequest(AddressKey.getUserAuth, data)
        .timeout(const Duration(seconds: 10), onTimeout: () {
      return ResponseModel.error('TimeoutException...');
    });
    if (response.status == Status.COMPLETED) {
        return ResponseModel.completed(response.data);
      } else {
      showCustomSnackBar('Error', response.message);
      return ResponseModel.error(response.message);
      }

  }


  //! step 1: send phone Number
  Future<ResponseModel> enterPassword(Map<String, dynamic> data) async {
    final response = await postRequest(AddressKey.verifyPhoneNumberPassword, data)
        .timeout(const Duration(seconds: 10), onTimeout: () {
      return ResponseModel.error('TimeoutException...');
    });
    if (response.status == Status.COMPLETED) {
      print(response.data);
        DataRepository().saveData(AddressKeyStorage.codeJWT, response.data);
        return ResponseModel.completed(response.data);
      } else {
        showCustomSnackBar('Error', response.message);
        return ResponseModel.error(response.message);
      }


  }

}
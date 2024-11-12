import 'package:GreenWave/Core/Constants/address_key.dart';
import 'package:GreenWave/Core/Data/Repositories/storage_repository.dart';
import 'package:get/get.dart';

import '../../../../Core/Services/response_model.dart';
import '../../../../Core/UI Helper/show_snack_bar.dart';
import '../../SwitchController/register_switch_controller.dart';
import '../Repository/mobile_repository.dart';

class RegisterMobileRegisterPhoneViewmodel extends GetxController {
  var email = ''.obs;
  var password = ''.obs;
  var isObscured = false.obs;
  var isPassword = ''.obs;
  final MobileRepository _checkNumber = MobileRepository();
  Rx<ResponseModel> state = ResponseModel.error('Nothing...').obs;
  var number = ''.obs;


  Future<void> postPassword(String num) async {
    state.value = ResponseModel.loading('isLoading...');

    number.value = num;
    if (password.value == '') {
      state.value = ResponseModel.error('Please enter password');
      return showCustomSnackBar('error', state.value.message);
    }

    var postPassword = {"phoneNumber": number.value, "password" : password.value};
    var response = await _checkNumber.enterPassword(postPassword);



    if (response.status == Status.COMPLETED) {
      state.value = response;
    } else {
      state.value = response;
      return showCustomSnackBar('error', state.value.message);
    }

  }


  void toggleObscured() {
    isObscured.value = !isObscured.value;
  }

  Future<void> checkStatus(String num) async {
    number.value = num;
    var isPasswordS = await DataRepository().loadData(AddressKeyStorage.isPassword);
    isPassword.value = isPasswordS;
  }

  void backPage() {
    var switchPage = Get.find<RegisterSwitchViewmodel>();
    switchPage.position.value = !switchPage.position.value;
    isPassword.value = 'false';
  }
}

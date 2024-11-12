import 'package:GreenWave/Core/Constants/address_key.dart';
import 'package:GreenWave/Core/Data/Repositories/storage_repository.dart';
import 'package:GreenWave/Core/UI%20Helper/show_snack_bar.dart';
import 'package:GreenWave/Features/Register/Mobile/Repository/mobile_repository.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';

import '../../../../Core/Services/response_model.dart';
import '../../SwitchController/register_switch_controller.dart';


class RegisterMobileViewmodel extends GetxController {
  var rememberMe = false.obs;
  final MobileRepository _checkNumber = MobileRepository();
  Rx<ResponseModel> state = ResponseModel.error('Nothing...').obs;
  var number = ''.obs;






  void toggleRememberMe() {
    rememberMe.value = !rememberMe.value;
  }



  Future<void> postNumber(String num) async {
    state.value = ResponseModel.loading('isLoading...');

    number.value = num;
    if (number.value == '') {
      state.value = ResponseModel.error('Please enter a number');
      return showCustomSnackBar('error', state.value.message);
    }

    var postNumber = {"phoneNumber": number.value};
    var response = await _checkNumber.sendPhoneNumber(postNumber);

    if (kDebugMode) {
      print(response.data);
    }

    if (response.status == Status.COMPLETED) {
      var isPassword = response.data['data']['isPassword'];
      if (isPassword == true) {
        DataRepository().saveData(AddressKeyStorage.isPassword, 'true');
      } else {
        DataRepository().saveData(AddressKeyStorage.isPassword, 'false');
      }
      state.value = response;
    } else {
      state.value = response;
      return showCustomSnackBar('error', state.value.message);
    }
  }
  void signInWithTelegram() {
    // Handle Apple Sign-In
  }



  void changePage() {
    var switchPage = Get.find<RegisterSwitchViewmodel>();
    switchPage.position.value = !switchPage.position.value;
  }
}

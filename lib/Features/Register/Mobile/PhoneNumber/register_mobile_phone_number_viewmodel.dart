import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../SwitchController/register_switch_controller.dart';


class RegisterMobileViewmodel extends GetxController {
  var rememberMe = false.obs;
  TextEditingController number = TextEditingController();

  void toggleRememberMe() {
    rememberMe.value = !rememberMe.value;
  }



  Future<void> checkNumber() async {
    if (number.text.isNotEmpty ) {

    } else {
      Get.snackbar('Error', 'Please enter a number');
    }
  }

  void signInWithGoogle() {
    // Handle Google Sign-In
  }

  void signInWithTelegram() {
    // Handle Apple Sign-In
  }

  void forgotPassword() {
    // Navigate to forgot password screen
  }

  void changePage() {
    var switchPage = Get.find<RegisterSwitchViewmodel>();
    switchPage.position.value = !switchPage.position.value;
  }
}

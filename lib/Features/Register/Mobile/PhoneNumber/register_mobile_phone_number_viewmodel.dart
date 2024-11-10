import 'package:get/get.dart';

import '../../SwitchController/register_switch_controller.dart';


class RegisterMobileViewmodel extends GetxController {
  var number = ''.obs;
  var rememberMe = false.obs;


  void toggleRememberMe() {
    rememberMe.value = !rememberMe.value;
  }



  Future<void> checkNumber() async {
    if (number.isNotEmpty ) {
      // Call API to log in
      // Handle success or error
    } else {
      Get.snackbar('Error', 'Email and password cannot be empty');
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

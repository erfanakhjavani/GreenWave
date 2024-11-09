import 'package:get/get.dart';

import '../../RegisterSwitch/register_switch_viewmodel.dart';

class RegisterMobileViewmodel extends GetxController {
  var number = ''.obs;
  var rememberMe = false.obs;
  var position = false.obs;


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
    position.value = !position.value;
  }
}

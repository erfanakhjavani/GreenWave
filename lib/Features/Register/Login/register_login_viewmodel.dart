import 'package:get/get.dart';

import '../RegisterSwitch/register_switch_viewmodel.dart';

class RegisterLoginViewmodel extends GetxController {
  var email = ''.obs;
  var password = ''.obs;
  var rememberMe = false.obs;
  var isObscured = false.obs;

  void toggleRememberMe() {
    rememberMe.value = !rememberMe.value;
  }

  void toggleObscured() {
    isObscured.value = !isObscured.value;
  }

  Future<void> login() async {
    if (email.isNotEmpty && password.isNotEmpty) {
      // Call API to log in
      // Handle success or error
    } else {
      Get.snackbar('Error', 'Email and password cannot be empty');
    }
  }

  void signInWithGoogle() {
    // Handle Google Sign-In
  }

  void signInWithApple() {
    // Handle Apple Sign-In
  }

  void forgotPassword() {
    // Navigate to forgot password screen
  }

  void signUp() {
    var switchPage = Get.find<RegisterSwitchViewmodel>();
    switchPage.showSignup.value = !switchPage.showSignup.value;
  }
}

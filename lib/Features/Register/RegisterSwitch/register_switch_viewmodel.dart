import 'package:get/get.dart';

class RegisterSwitchViewmodel extends GetxController {
  var showSignup = false.obs;

  void toggleView() {
    showSignup.value = !showSignup.value;
  }
}

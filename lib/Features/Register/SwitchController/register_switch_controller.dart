import 'package:get/get.dart';

class RegisterSwitchViewmodel extends GetxController {
  var position = false.obs;

  void toggleView() {
    position.value = !position.value;
  }
}

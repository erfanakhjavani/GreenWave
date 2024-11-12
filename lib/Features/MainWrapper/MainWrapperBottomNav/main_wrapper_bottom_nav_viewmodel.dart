import 'package:get/get.dart';

class MainWrapperBottomNavViewmodel extends GetxController {
  var selectedIndex = 0.obs;

  void onTabSelected(int index) {
    selectedIndex.value = index;
  }
}

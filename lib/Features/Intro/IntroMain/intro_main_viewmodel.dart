import 'dart:ui';

import 'package:get/get.dart';
import '../../../Core/Data/Repositories/intro_repository.dart';
import '../../../Core/Services/response_model.dart';

class IntroMainViewmodel extends GetxController {
  final IntroRepository _introRepository = IntroRepository();
  var isTermsAccepted = false.obs;
  Rx<ResponseModel> state = ResponseModel.loading('Loading...').obs;
  var boolState = true.obs;

  void changeLanguage(String languageCode) {
    if (languageCode == 'en') {
      Get.updateLocale(const Locale('en', 'US'));
    } else {
      Get.updateLocale(const Locale('fa', 'IR'));
    }
  }

  Future<void> postPlatform() async {
    boolState.value = false;

    int platformCode = 0;
    if (GetPlatform.isAndroid) {
      platformCode = 1;
    } else if (GetPlatform.isIOS) {
      platformCode = 2;
    } else if (GetPlatform.isWeb) {
      platformCode = 3;
    }

    var response = await _introRepository.postPlatformData(platformCode);

    if (response.status == Status.COMPLETED) {
      boolState.value = true;
      state.value = response;
    } else {
      boolState.value = true;
      state.value = response;
    }

    refresh();
  }

  void startChallenge() {
    print("Challenge Started");
  }
}

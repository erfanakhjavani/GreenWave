import 'dart:ui';

import 'package:get/get.dart';
import '../Repositories/intro_repository.dart';
import '../../../Core/Services/response_model.dart';

class IntroMainViewmodel extends GetxController {
  final IntroRepository _introRepository = IntroRepository();
  var isTermsAccepted = false.obs;
  Rx<ResponseModel> state = ResponseModel.error('Nothing...').obs;

  void changeLanguage(String languageCode) {
    if (languageCode == 'en') {
      Get.updateLocale(const Locale('en', 'US'));
    } else {
      Get.updateLocale(const Locale('fa', 'IR'));
    }
  }

  Future<void> postPlatform() async {
    state.value = ResponseModel.loading('isLoading...');
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
      state.value = response;
    } else {
      state.value = response;
    }
  }

  void startChallenge() {
    print("Challenge Started");
  }
}

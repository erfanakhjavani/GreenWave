import 'package:GreenWave/Core/Data/DataSource/response_model.dart';
import 'package:GreenWave/Core/Data/Repositories/data_repository.dart';
import 'package:GreenWave/Features/Intro/IntroMain/intro_main_model.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../Core/Constants/address_key.dart';

class IntroMainViewmodel extends GetxController {
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
    Dio dio = Dio();
    Map<String, dynamic> data = {"platform": ""};
    try {
      try {
        if (GetPlatform.isAndroid) {
          data["platform"] = 1;
        } else if (GetPlatform.isIOS) {
          data["platform"] = 2;
        } else if (GetPlatform.isWeb) {
          data["platform"] = 3;
        }
        //  data["platform"] =  Platform.isAndroid ? 1 : Platform.isIOS ? 2 : 3; // 1 -> android, 2 -> ios, 3 -> web
      } catch (e) {
        boolState.value = true;
        state.value = ResponseModel.error('error: $e');
      }

      var response = await dio
          .post(
            AddressKey.postPlatform,
            data: data,
          )
          .timeout(const Duration(seconds: 5));
      print(response);
      if (response.statusCode == 200) {
        boolState.value = false;
        var dataJson = response.data;
        var dataResponse = IntroMainModel(
          message: dataJson['message'],
          status: dataJson['statusCode'],
          data: dataJson['data'],
        );
        if (dataResponse.status == 200) {
          boolState.value = true;
          state.value = ResponseModel.completed(dataResponse);
          DataRepository().saveData('codeRD', dataResponse.data);
        } else {
          boolState.value = true;
          state.value = ResponseModel.error(dataResponse.message);
        }
      }
    } catch (e) {
      boolState.value = true;
      state.value = ResponseModel.error('Error occurred: $e');
    }
    refresh();
  }

  void startChallenge() {
    print("Challenge Started");
  }
}

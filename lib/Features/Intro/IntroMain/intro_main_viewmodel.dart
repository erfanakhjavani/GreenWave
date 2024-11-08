import 'dart:io';
import 'package:GreenWave/Core/Data/DataSource/response_model.dart';
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
    Dio dio = Dio();
    try {
      Map<String, dynamic> data = {
        "platform": Platform.isAndroid ? 1 : Platform.isIOS ? 2 : 3, // 1 -> android, 2 -> ios, 3 -> web
      };
      var response = await dio.post(
        AddressKey.postPlatform,
        data: data,
      );
      print(response);
      if (response.statusCode == 200) {
        var dataJson = response.data;
        var dataResponse = IntroMainModel(
          message: dataJson['message'],
          status: dataJson['statusCode'],
          data: dataJson['data'],
        );
        if (dataResponse.status == 200) {
          state.value = ResponseModel.completed(dataResponse);
        } else {
          state.value = ResponseModel.error(dataResponse.message);
        }
      }
    } catch (e) {
      state.value = ResponseModel.error('Error occurred: $e');
    }
    refresh();
  }

  Future<void> checkState() async{
    switch (state.value.status) {
      case Status.LOADING:
        boolState.value = false;
        break;
      case Status.COMPLETED:
      case Status.ERROR:
        boolState.value = true;
        break;
    }
    refresh();
  }

  void startChallenge() {
    print("Challenge Started");
  }
}


import 'dart:io';
import 'package:GreenWave/Core/Constants/address_key.dart';
import 'package:dio/dio.dart';

class ApiProvider{


  //! Post for checking platform
  Future<dynamic> postPlatformData() async {
    Dio dio = Dio();
    Map<String, dynamic> data = {
      "platform": Platform.isAndroid ? 1 : Platform.isIOS ? 2 : 3, // 1 -> android, 2 -> ios, 3 -> web
    };
      var response = await dio.post(
        AddressKey.postPlatform,
        data: data,
      );

      return response;
  }
}
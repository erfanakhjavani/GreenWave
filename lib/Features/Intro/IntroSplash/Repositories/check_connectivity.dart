import 'dart:async';
import 'dart:io';
import 'package:GreenWave/Features/Intro/IntroSplash/model/intro_splash_model.dart';
import 'package:get/get.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart';
import 'package:hive/hive.dart';

class SplashRepository extends GetConnect {
  Future<bool> checkConnectivity() async {
    var connectivityResult = await Connectivity().checkConnectivity();
    bool isWeb = GetPlatform.isWeb ? true : true;

    if (connectivityResult.contains(ConnectivityResult.none)) {
      //! No network connection.
      return isWeb;
    } else {
      //! Connected to a network (Wi-Fi or mobile).
      try {
        final response = await get(
          'https://www.google.com',
        ).timeout(const Duration(seconds: 3));

        if (response.statusCode == 200) {
          //! Internet connection is available.
          return true;
        } else {
          //! Connected to a network but no internet access.
          return isWeb;
        }
      } on TimeoutException catch (_) {
        print(_.toString());
        //! Request timed out (considered as no internet access).
        return isWeb;
      } catch (e) {
        e.toString();
        //! Other errors.
        return isWeb;
      }
    }
  }

  Future<void> postPlatformData() async {
    Dio dio = Dio();
    Map<String, dynamic> data = {
      "platform": Platform.isAndroid ? 1 : Platform.isIOS ? 2 : 3, // 1 -> android, 2 -> ios, 3 -> web
    };
    try {
      var dataBox = Hive.box<IntroSplashModel>('introRegisterBox');
       var response = await dio.post(
        'https://your-api-url.com/endpoint',
        data: data,
      );

      if (response.statusCode == 200) {
        var responseData = response.data;
        print("status : ${responseData['statusCode']}");
        print("message : ${responseData['message']}");
        print("data :${responseData['data']}");
        dataBox.add(IntroSplashModel(data: responseData['data'], isRegistered: true));
      } else {
        print("error to get data${response.statusCode}");
      }
    } catch (e) {
      print("error : $e");
    }
  }
}
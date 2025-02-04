import 'dart:async';
import 'package:GreenWave/Core/Constants/address_key.dart';
import 'package:GreenWave/Core/Services/response_model.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import '../../../Core/Data/Repositories/base_repository.dart';

class SplashRepository extends BaseRepository {
  Future<bool> checkConnectivity() async {
    var connectivityResult = await Connectivity().checkConnectivity();
    bool isWeb = false;

    if (connectivityResult == ConnectivityResult.none) {
      //! No network connection
      return isWeb;
    } else {
      //! Connected to a network (Wi-Fi or mobile)
      try {
        final response = await getRequest(
          AddressKey.checkConnect,
          options: Options(headers: {
            'Content-Type': 'application/json',
          }),
        ).timeout(const Duration(seconds: 3));

        if (response.status == Status.COMPLETED) {
          //! Internet connection is available
          return true;
        } else {
          //! Connected to a network but no internet access
          return isWeb;
        }
      } on TimeoutException catch (e) {
        if (kDebugMode) {
          print("TimeoutException: ${e.toString()}");
        }
        //! Request timed out (considered as no internet access)
        return isWeb;
      } catch (e) {
        if (kDebugMode) {
          print("Error: ${e.toString()}");
        }
        //! Other errors
        return isWeb;
      }
    }
  }
}

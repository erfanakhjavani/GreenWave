import 'dart:async';

import 'package:GreenWave/Core/Constants/address_key.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:get/get.dart';

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
          AddressKey.checkConnect,
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
}

import 'package:get/get.dart';

import '../Repositories/check_connectivity.dart';
import '../../../Core/Services/response_model.dart';

//! SplashViewModel class handles splash logic, including checking internet connection and navigation
class IntroSplashViewmodel extends GetxController {
  Rx<ResponseModel> state = ResponseModel.error('Nothing...').obs;
  final SplashRepository splashRepository =
      SplashRepository(); //* Repository to check connectivity

  @override
  void onInit() {
    checkConnection(); //! Check the connection status when the controller is initialized
    super.onInit();
  }

  @override
  void dispose() {
    checkConnection(); //* Check the connection again before disposing (though this is uncommon)
    super.dispose();
  }

  //! Method to check internet connection and handle the navigation flow
  Future<void> checkConnection() async {
    state.value = ResponseModel.loading('Loading...');
    Future.delayed(const Duration(seconds: 2),() async {
      bool isConnected =
          await splashRepository.checkConnectivity(); //* Check if connected
      if (isConnected == true) {
        state.value = ResponseModel.completed(isConnected);
      } else {
        return state.value = ResponseModel.error(
            'error connection...'); //* Set status to disconnected if no internet
      }
    });
  }
}


import 'package:GreenWave/Features/Intro/IntroSplash/repositories/check_connectivity.dart';
import 'package:GreenWave/Features/Intro/IntroWelcome/intro_welcome_view.dart';
import 'package:get/get.dart';


//! SplashViewModel class handles splash logic, including checking internet connection and navigation
class IntroSplashViewmodel extends GetxController {
  var connectionStatus = ConnectionStatus.initial.obs; //* Observable for connection status
  final SplashRepository splashRepository = SplashRepository(); //* Repository to check connectivity

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
    connectionStatus.value = ConnectionStatus.initial; //* Set initial status
    Future.delayed(const Duration(seconds: 3), () async {
      bool isConnected = await splashRepository.checkConnectivity(); //* Check if connected
      if (isConnected == true) {
        connectionStatus.value = ConnectionStatus.connected; //* Update status to connected
        Future.delayed(const Duration(seconds: 3),(){
          Get.offAll(const IntroWelcomeView()); //* Navigate to description screen if connected
        });
      } else {
        return connectionStatus.value = ConnectionStatus.disconnected; //* Set status to disconnected if no internet
      }
    });
  }


}

//! variables connection
enum ConnectionStatus {
  initial,
  connected,
  disconnected,
}

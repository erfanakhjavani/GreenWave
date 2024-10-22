import 'package:get/get.dart';
import '../../Features/Intro/IntroMain/intro_main_viewmodel.dart';
import '../../Features/Intro/IntroSplash/intro_splash_viewmodel.dart';
import '../../Features/Intro/IntroWelcome/intro_welcome_viewmodel.dart';
import '../../Features/MainWrapper/MainWrapperHome/main_wrapper_home_viewmodel.dart';

class MyBindings extends Bindings{
  @override
  void dependencies() {
    Get.put(IntroSplashViewmodel());
    Get.put(MainWrapperHomeViewmodel());
    Get.put(IntroWelcomeViewmodel());
    Get.put(IntroMainViewmodel());
  }

}
import 'package:GreenWave/Features/MainWrapper/DialogImage/dialog_controller.dart';
import 'package:GreenWave/Features/MainWrapper/MainWrapperBottomNav/main_wrapper_bottom_nav_viewmodel.dart';
import 'package:get/get.dart';

import '../../Features/Intro/IntroMain/intro_main_viewmodel.dart';
import '../../Features/Intro/IntroSplash/intro_splash_viewmodel.dart';
import '../../Features/Intro/IntroWelcome/intro_welcome_viewmodel.dart';
import '../../Features/MainWrapper/MainWrapperHome/main_wrapper_home_viewmodel.dart';
import '../../Features/Register/Login/register_login_viewmodel.dart';
import '../../Features/Register/Mobile/PhoneNumber/register_mobile_phone_number_viewmodel.dart';
import '../../Features/Register/Mobile/RegisterPhone/register_mobile_register_phone_viewmodel.dart';
import '../../Features/Register/SignUp/register_signup_viewmodel.dart';
import '../../Features/Register/SwitchController/register_switch_controller.dart';

class MyBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(IntroSplashViewmodel());
    Get.put(MainWrapperHomeViewmodel());
    Get.put(IntroWelcomeViewmodel());
    Get.put(IntroMainViewmodel());
    Get.put(RegisterLoginViewmodel());
    Get.put(RegisterSwitchViewmodel());
    Get.put(RegisterSignupViewmodel());
    Get.put(MainWrapperBottomNavViewmodel());
    Get.lazyPut(() => DialogController());
    Get.put(RegisterMobileViewmodel());
    Get.put(RegisterMobileRegisterPhoneViewmodel());
  }
}

import 'package:GreenWave/Features/MainWrapper/DialogWrapper/wrapper_dialog_viewmodel.dart';
import 'package:GreenWave/Features/MainWrapper/MainWrapperBottomNav/main_wrapper_bottom_nav_viewmodel.dart';
import 'package:GreenWave/Features/MainWrapper/MainWrapperProfile/main_wrapper_profile_viewmodel.dart';
import 'package:GreenWave/telegram_controller.dart';
import 'package:get/get.dart';

import '../../Features/Intro/IntroMain/intro_main_viewmodel.dart';
import '../../Features/Intro/IntroSplash/intro_splash_viewmodel.dart';
import '../../Features/Intro/IntroWelcome/intro_welcome_viewmodel.dart';
import '../../Features/MainWrapper/DialogWrapper/DialogChoiceItem/dialog_choice_item_viewmodel.dart';
import '../../Features/MainWrapper/DialogWrapper/DialogSendImage/dialog_send_image_viewmodel.dart';
import '../../Features/MainWrapper/MainWrapperHome/main_wrapper_home_viewmodel.dart';
import '../../Features/MainWrapper/MainWrapperWallet/main_wrapper_wallet_viewmodel.dart';
import '../../Features/Register/Login/register_login_viewmodel.dart';
import '../../Features/Register/Mobile/PhoneNumber/register_mobile_phone_number_viewmodel.dart';
import '../../Features/Register/Mobile/RegisterPhone/register_mobile_register_phone_viewmodel.dart';
import '../../Features/Register/SignUp/register_signup_viewmodel.dart';
import '../../Features/Register/SwitchController/register_switch_controller.dart';

class MyBindings extends Bindings {
  @override
  void dependencies() {

    Get.put(TelegramController());

    //! Intro
    Get.put(IntroSplashViewmodel());
    Get.lazyPut(()=>IntroWelcomeViewmodel());
    Get.lazyPut(()=> IntroMainViewmodel());



    //! MainWrapper
    Get.lazyPut(()=> WrapperDialogViewmodel());
    Get.lazyPut(()=> DialogChoiceItemViewmodel(),);
    Get.lazyPut(()=> DialogSendImageViewmodel());
    Get.lazyPut(()=> MainWrapperBottomNavViewmodel());
    Get.lazyPut(()=>MainWrapperHomeViewmodel());
    Get.lazyPut(()=> MainWrapperProfileViewmodel());
    Get.put(MainWrapperWalletViewmodel());



    //! Register
    Get.lazyPut(()=> RegisterLoginViewmodel());
    Get.lazyPut(()=> RegisterSwitchViewmodel());
    Get.lazyPut(()=> RegisterSignupViewmodel());
    Get.lazyPut(()=> RegisterMobileViewmodel());
    Get.lazyPut(()=> RegisterMobileRegisterPhoneViewmodel());




  }
}

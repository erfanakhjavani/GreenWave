import 'package:get/get.dart';

import '../../Features/Intro/IntroMain/intro_main_view.dart';
import '../../Features/Intro/IntroSplash/intro_splash_view.dart';
import '../../Features/Intro/IntroWelcome/intro_welcome_view.dart';
import '../../Features/MainWrapper/MainWrapperBottomNav/main_wrapper_bottom_nav_view.dart';
import '../../Features/MainWrapper/MainWrapperHome/main_wrapper_home_view.dart';
import '../../Features/MainWrapper/MainWrapperQuest/main_wrapper_quest_view.dart';
import '../../Features/MainWrapper/MainWrapperWallet/main_wrapper_wallet_view.dart';
import '../../Features/Register/Login/register_login_view.dart';
import '../../Features/Register/Mobile/RegisterPhone/register_mobile_register_phone_view.dart';
import '../../Features/Register/SignUp/register_signup_view.dart';
import '../Widgets/animate_switch.dart';

class AppRoute {


  //! intro
  static const String introSplashView = '/introSplash';
  static const String introMainView = '/introMain';
  static const String introWelcomeView = '/introWelcome';


  //! main wrapper
  static const String switcherDialog = '/switcherDialog';
  static const String mainWrapperBottomNavView = '/mainWrapperBottomNav';
  static const String mainWrapperHomeView = '/mainWrapperHome';
  static const String mainWrapperQuestView = '/mainWrapperQuest';
  static const String mainWrapperWalletView = '/mainWrapperWallet';
  static const String mainWrapperProfileView = '/mainWrapperProfile';



  //! register
  static const String registerSwitchMobileView = '/registerSwitchMobile';
  static const String registerSwitchView = '/registerSwitch';
  static const String registerMobileRegisterPhoneView = '/registerMobileRegisterPhone';
  static const String registerSignupView = '/registerSignup';
  static const String registerLoginView = '/registerLogin';

  static List<GetPage> pages = [


    //! intro
    GetPage(name: introSplashView, page: () => const IntroSplashView()),
    GetPage(name: introMainView, page: () => const IntroMainView()),
    GetPage(name: introWelcomeView, page: () => const IntroWelcomeView()),



    //! main wrapper
    GetPage(name: switcherDialog, page: () => const SwitcherDialog()),
    GetPage(name: mainWrapperBottomNavView, page: () => MainWrapperBottomNavView()),
    GetPage(name: mainWrapperHomeView, page: () => const MainWrapperHomeView()),
    GetPage(name: mainWrapperQuestView, page: () => const MainWrapperQuestView()),
    GetPage(name: mainWrapperWalletView, page: () => MainWrapperWalletView()),
    GetPage(name: mainWrapperWalletView, page: () => MainWrapperWalletView()),




    //! register
    GetPage(name: registerSwitchMobileView, page: () => const RegisterSwitchMobileView()),
    GetPage(name: registerSwitchView, page: () => const RegisterSwitchView()),
    GetPage(name: registerMobileRegisterPhoneView, page: () =>  RegisterMobileRegisterPhoneView()),
    GetPage(name: registerSignupView, page: () => const RegisterSignupView()),
    GetPage(name: registerLoginView, page: () => const RegisterLoginView()),
  ];
}

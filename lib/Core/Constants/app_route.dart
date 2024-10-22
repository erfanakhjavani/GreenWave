import 'package:get/get.dart';

import '../../Features/Intro/IntroSplash/intro_splash_view.dart';


class AppRoute {
  static const String splashView = '/SplashView';


  static List<GetPage> pages = [
    GetPage(name: splashView, page: () =>  const IntroSplashView()),
  ];
}

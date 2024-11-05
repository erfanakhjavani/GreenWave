import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'Core/Bindings/bindings.dart';
import 'Core/Constants/app_route.dart';
import 'Core/Themes/theme_service.dart';
import 'Core/Themes/themes.dart';
import 'Features/Intro/IntroSplash/model/intro_splash_model.dart';

//! Main function to initialize the app and set up system configurations
void main() async{
  WidgetsFlutterBinding.ensureInitialized(); //* Ensure Flutter is fully initialized before running
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]); //* Lock screen orientation to portrait mode
  await Hive.initFlutter();
  Get.put(ThemeService());
  runApp(const Main()); //* Run the main app widget
}

//! Main class for the app, extends StatelessWidget
class Main extends StatelessWidget {
  const Main({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Obx(
              () => GetMaterialApp(
            debugShowCheckedModeBanner: false, //* Disable debug banner
            getPages: AppRoute.pages, //* Define app routes
            initialBinding: MyBindings(), //* Set initial bindings for dependency injection
            darkTheme: Themes.dark, //* Define dark theme
            theme: Themes.light, //* Define light theme
            themeMode: Get.find<ThemeService>().theme, //* Use the theme defined by ThemeService
            initialRoute: AppRoute.splashView, //* Set the initial route (splash screen)

          )
      ),
    );
  }
}

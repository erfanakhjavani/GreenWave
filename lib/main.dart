import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';

import 'Core/Bindings/bindings.dart';
import 'Core/Constants/app_route.dart';
import 'Core/Themes/theme_service.dart';
import 'Core/Themes/themes.dart';

//! Main function to initialize the app and set up system configurations
void main() async {
  WidgetsFlutterBinding.ensureInitialized(); //* Ensure Flutter is fully initialized before running
  Get.put(ThemeService());
  runApp(const Main()); //* Run the main app widget
}

//! Main class for the app, extends StatelessWidget
class Main extends StatelessWidget {
  const Main({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      //* Disable debug banner
      getPages: AppRoute.pages,
      //* Define app routes
      initialBinding: MyBindings(),
      //* Set initial bindings for dependency injection
      darkTheme: Themes.dark,
      //* Define dark theme
      theme: Themes.light,
      //* Define light theme
      themeMode: Get.find<ThemeService>().theme,
      //* Use the theme defined by ThemeService
       initialRoute:
           AppRoute.introSplashView, //* Set the initial route (splash screen)
    );
  }
}

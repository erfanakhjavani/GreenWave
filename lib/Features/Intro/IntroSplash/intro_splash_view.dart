import 'package:GreenWave/Features/Intro/IntroSplash/widgets/splash_description_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import '../../../Core/Constants/app_colors.dart';
import 'intro_splash_model.dart';
import 'intro_splash_viewmodel.dart';

//! SplashView class to display the splash screen and handle connection status
class IntroSplashView extends GetView<IntroSplashViewmodel> {
  const IntroSplashView({super.key});

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.sizeOf(context).width; //* Get the width of the screen
    var height = MediaQuery.sizeOf(context).height; //* Get the height of the screen

    return Scaffold(
      body: SafeArea(
        child: Container(
          width: width,
          height: height,
          decoration:  BoxDecoration(
            gradient: LinearGradient(
              colors: [AppColors.primary, AppColors.secondary],
              stops: const [0.6, 8.18],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            )
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center, //* Center the content vertically
            children: [
              Obx((){
                return AnimatedCrossFade(
                    firstChild: Image.asset(
                      'assets/png/logo.png', //* Display the logo image
                      fit: BoxFit.fill, //* Fit the image to the screen width

                    ),
                    secondChild: const SplashDescriptionWidget(),
                    crossFadeState: controller.connectionStatus == ConnectionStatus.connected
                        ? CrossFadeState.showSecond : CrossFadeState.showFirst,
                    duration: const Duration(seconds: 1),

                );
              }),

              //! Handle connection status with reactive programming
              Obx(() {
                //* Check if the app is connected to the internet or in the initial state
                if (controller.connectionStatus.value == ConnectionStatus.connected) {}
                //* If the connection is lost, show an error message and a retry button
                else if (controller.connectionStatus.value == ConnectionStatus.disconnected) {
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.center, //* Center content vertically
                    children: [
                      Text(
                        'please check your connection..!',
                        style: Get.textTheme.bodyLarge, //* Style the message
                      ),
                      IconButton(
                        onPressed: () {
                          controller.checkConnection(); //* Retry connection on button press
                        },
                        icon: Icon(Icons.autorenew, color: Get.theme.primaryColor), //* Retry icon
                      ),
                    ],
                  );
                }
                if(controller.connectionStatus == ConnectionStatus.initial){
                  //* If still loading, show a loading animation
                  return LoadingAnimationWidget.inkDrop(
                      color: Colors.white,
                      size: 30);
                }
                return const SizedBox.shrink(); //* Return a whitespace to avoid rendering errors
              }),
            ],
          ),
        ),
      ),
    );
  }
}

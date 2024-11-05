import 'package:GreenWave/Features/Intro/IntroSplash/widgets/splash_description_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import '../../../Core/Constants/app_colors.dart';
import '../../../Core/Gen/assets.gen.dart';
import 'intro_splash_viewmodel.dart';

//! SplashView class to display the splash screen and handle connection status
class IntroSplashView extends GetView<IntroSplashViewmodel> {
  const IntroSplashView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            // Get the screen width and height from the constraints
            double width = constraints.maxWidth;
            double height = constraints.maxHeight;

            return Container(
              width: width,
              height: height,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [AppColors.monopolyColor1, AppColors.monopolyColor2],
                  stops: const [0.6, 1.0],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center, // Center content vertically
                children: [
                  Obx(() {
                    return AnimatedCrossFade(
                      firstChild: FractionallySizedBox(
                        widthFactor: width > 800 ? 0.3 : 0.6, // Responsive size
                        child: Assets.png.logo.image(
                          fit: BoxFit.contain,
                        ),
                      ),
                      secondChild: const SplashDescriptionWidget(),
                      crossFadeState: controller.connectionStatus == ConnectionStatus.connected
                          ? CrossFadeState.showSecond
                          : CrossFadeState.showFirst,
                      duration: const Duration(seconds: 1),
                    );
                  }),

                  //! Handle connection status with reactive programming
                  Obx(() {
                    if (controller.connectionStatus.value == ConnectionStatus.connected) {
                      return const SizedBox.shrink();
                    } else if (controller.connectionStatus.value == ConnectionStatus.disconnected) {
                      return Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: width * 0.1),
                            child: Text(
                              'Please check your connection..!',
                              style: Get.textTheme.bodyLarge,
                              textAlign: TextAlign.center,
                            ),
                          ),
                          IconButton(
                            onPressed: () {
                              controller.checkConnection();
                            },
                            icon: Icon(
                              Icons.autorenew,
                              color: Get.theme.primaryColor,
                              size: width * 0.08,
                            ),
                          ),
                        ],
                      );
                    } else if (controller.connectionStatus.value == ConnectionStatus.initial) {
                      return LoadingAnimationWidget.bouncingBall(
                        color: Colors.white,
                        size: width * 0.1,
                      );
                    }
                    return const SizedBox.shrink();
                  }),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}

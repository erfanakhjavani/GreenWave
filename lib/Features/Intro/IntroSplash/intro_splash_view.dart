import 'package:GreenWave/Core/Constants/address_key.dart';
import 'package:GreenWave/Core/Constants/app_route.dart';
import 'package:GreenWave/Features/Intro/IntroSplash/widgets/splash_description_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

import '../../../Core/Constants/app_colors.dart';
import '../../../Core/Data/Repositories/storage_repository.dart';
import '../../../Core/Gen/assets.gen.dart';
import '../../../Core/Services/response_model.dart';
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
                // gradient: LinearGradient(
                //   colors: [AppColors.monopolyColor1, AppColors.monopolyColor2],
                //   stops: const [0.6, 1.0],
                //   begin: Alignment.topCenter,
                //   end: Alignment.bottomCenter,
                // ),
                color: AppColors.monopolyColor2
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                // Center content vertically
                children: [
                      FractionallySizedBox(
                        child: Assets.png.logo.image(
                          fit: BoxFit.cover,
                        ),
                      ),

                  //! Handle connection status with reactive programming
                  Obx(() {
                    if (controller.state.value.status == Status.COMPLETED) {
                      Future.sync(() async {
                        var codeJWT = await DataRepository().loadData(AddressKeyStorage.codeJWT);
                        var checkWP = await DataRepository().loadData(AddressKeyStorage.checkReadWelcomeView);
                        if (codeJWT != null){
                          Get.toNamed(AppRoute.mainWrapperBottomNavView); //* Navigate to Welcome screen if data is loaded
                        }
                        else if (checkWP != null){
                          Get.toNamed(AppRoute.introMainView); //* Navigate to Welcome screen if data is not loaded
                        }
                        else {
                          Get.toNamed(AppRoute.introWelcomeView); //* Navigate to Welcome screen if data is not loaded
                        }
                      });
                    } else if (controller.state.value.status == Status.ERROR) {
                      return Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding:
                                EdgeInsets.symmetric(horizontal: width * 0.1),
                            child: Text(
                              'Please check your connection..!',
                              style: Get.textTheme.bodyLarge!.copyWith(
                                color: Colors.white
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                          IconButton(
                            onPressed: () {
                              controller.checkConnection();
                            },
                            icon: Icon(
                              Icons.autorenew,
                              color: AppColors.secondary,
                              size: width * 0.08,
                            ),
                          ),
                        ],
                      );
                    } else if (controller.state.value.status ==
                        Status.LOADING) {
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

import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../Login/register_login_view.dart';
import '../SignUp/register_signup_view.dart';
import 'register_switch_viewmodel.dart';

class RegisterSwitchView extends GetView<RegisterSwitchViewmodel> {
  const RegisterSwitchView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Obx(() => PageTransitionSwitcher(
              duration: const Duration(milliseconds: 500),
              transitionBuilder: (Widget child,
                  Animation<double> primaryAnimation,
                  Animation<double> secondaryAnimation) {
                return SharedAxisTransition(
                  animation: primaryAnimation,
                  secondaryAnimation: secondaryAnimation,
                  transitionType: SharedAxisTransitionType.horizontal,
                  child: child,
                );
              },
              child: controller.showSignup.value
                  ? const RegisterSignupView()
                  : const RegisterLoginView(),
            )),
      ),
    );
  }
}

import 'package:GreenWave/Core/Constants/app_colors.dart';
import 'package:GreenWave/Features/MainWrapper/MainWrapperBottomNav/main_wrapper_bottom_nav_view.dart';
import 'package:GreenWave/Features/Register/Login/register_login_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

import '../../../Core/Gen/assets.gen.dart';

class RegisterLoginView extends GetView<RegisterLoginViewmodel> {
  const RegisterLoginView({super.key});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.sizeOf(context).height;
    var width = MediaQuery.sizeOf(context).width;
    var textTheme = Theme.of(context).textTheme;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Lottie.asset(Assets.json.waveloop, height: 250),
            SingleChildScrollView(
              padding:
                  EdgeInsets.symmetric(horizontal: width < 900 ? 24.0 : 240.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 0.0),
                    child: Text(
                      'Welcome back!',
                      style: textTheme.headlineMedium,
                    ),
                  ),
                  const SizedBox(height: 8.0),
                  const Padding(
                    padding: EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 30.0),
                    child:
                        Text('Enter your Credentials to access your account'),
                  ),
                  const SizedBox(height: 10.0),
                  SizedBox(
                    width: width * 1.5,
                    height: 45,
                    child: TextField(
                      cursorColor: Colors.grey.shade600,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.grey.shade500),
                            borderRadius: BorderRadius.circular(10)),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.grey.shade600),
                            borderRadius: BorderRadius.circular(10)),
                        hintText: 'Email address or Username',
                      ),
                      onChanged: (value) => controller.email.value = value,
                    ),
                  ),
                  const SizedBox(height: 16.0),
                  Obx(
                    () => SizedBox(
                      width: width * 1.5,
                      height: 78,
                      child: TextField(
                        cursorColor: Colors.grey.shade600,
                        style: textTheme.bodyMedium,
                        decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.grey.shade500),
                                borderRadius: BorderRadius.circular(10)),
                            focusedBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.grey.shade600),
                                borderRadius: BorderRadius.circular(10)),
                            hintText: 'Password',
                            suffixIcon: IconButton(
                                onPressed: () {
                                  controller.toggleObscured();
                                },
                                icon: Icon(
                                  controller.isObscured.value
                                      ? Icons.visibility_outlined
                                      : Icons.visibility_off_outlined,
                                  color: Colors.grey,
                                )),
                            contentPadding: const EdgeInsets.only(left: 10),
                            counter: TextButton(
                                onPressed: () {},
                                child: Text(
                                  'Forgot password?',
                                  style: textTheme.bodySmall,
                                ))),
                        obscureText: controller.isObscured.value,
                        onChanged: (value) => controller.password.value = value,
                      ),
                    ),
                  ),
                  const SizedBox(height: 16.0),
                  Row(
                    children: [
                      Obx(() => Checkbox(
                            activeColor: AppColors.monopolyColor1,
                            value: controller.rememberMe.value,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5)),
                            onChanged: (value) => controller.toggleRememberMe(),
                          )),
                      const Text('Remember me on device'),
                    ],
                  ),
                  const SizedBox(height: 24.0),
                  Center(
                    child: SizedBox(
                        width: width * 1.5,
                        height: 40,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppColors.monopolyColor2,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                          ),
                          onPressed: () {
                            Get.offAll(MainWrapperBottomNavView());
                          },
                          child: Text(
                            'Login',
                            style: textTheme.bodyMedium!.copyWith(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        )),
                  ),
                  const SizedBox(height: 25.0),
                  Row(
                    children: [
                      const Expanded(child: Divider()),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: Text('Or', style: textTheme.labelLarge),
                      ),
                      const Expanded(child: Divider()),
                    ],
                  ),
                  const SizedBox(height: 25.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      width > 800
                          ? ElevatedButton.icon(
                              onPressed: controller.signInWithGoogle,
                              icon: Assets.png.google.image(width: 20),
                              label: const Text('Sign in with Google'),
                              style: ElevatedButton.styleFrom(
                                  foregroundColor: Colors.black,
                                  backgroundColor: Colors.white),
                            )
                          : IconButton(
                              onPressed: controller.signInWithGoogle,
                              icon: Assets.png.google.image(width: 20),
                              style: ElevatedButton.styleFrom(
                                  foregroundColor: Colors.black,
                                  backgroundColor: Colors.white),
                            ),
                      const SizedBox(width: 5.0),
                      width > 800
                          ? ElevatedButton.icon(
                              onPressed: controller.signInWithApple,
                              icon: Icon(
                                Icons.apple,
                                size: 35,
                                color: AppColors.primary,
                              ),
                              label: Text(
                                'Sign in with Apple',
                                style: TextStyle(color: AppColors.primary),
                              ),
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: AppColors.secondary),
                            )
                          : IconButton(
                              onPressed: controller.signInWithApple,
                              icon: Icon(
                                Icons.apple,
                                size: 30,
                                color: AppColors.primary,
                              ),
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: AppColors.secondary),
                            ),
                    ],
                  ),
                  const SizedBox(height: 24.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Don’t have an account?',
                        style: textTheme.bodyMedium,
                      ),
                      TextButton(
                          onPressed: controller.signUp,
                          child: Text(
                            'Sign Up',
                            style: textTheme.bodySmall!
                                .copyWith(color: Colors.blueAccent.shade700),
                          ))
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

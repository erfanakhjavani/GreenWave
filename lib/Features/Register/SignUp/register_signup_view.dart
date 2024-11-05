import 'package:GreenWave/Core/Constants/app_colors.dart';
import 'package:GreenWave/Features/Register/SignUp/register_signup_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

import '../../../Core/Gen/assets.gen.dart';

class RegisterSignupView extends GetView<RegisterSignupViewmodel> {
  const RegisterSignupView({super.key});


  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.sizeOf(context).height;
    var width = MediaQuery.sizeOf(context).width;
    var textTheme = Theme.of(context).textTheme;
    return Scaffold(
      body: SingleChildScrollView(
        padding:  EdgeInsets.symmetric(horizontal: width < 800 ? 24.0: 150.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Lottie.asset(Assets.json.wave2,height: height * 0.25, width: width),
            Padding(
              padding: const EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 0.0),
              child: Text(
                'Get Started Now',
                style: textTheme.headlineMedium,
              ),
            ),
            const SizedBox(height: 20.0),

            SizedBox(
              width: width * 1.5,
              height: 45,
              child: TextField(
                cursorColor: Colors.grey.shade600,
                style: textTheme.bodySmall,
                decoration: InputDecoration(
                  border:
                  OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey.shade500),
                      borderRadius: BorderRadius.circular(10)),
                  focusedBorder:
                  OutlineInputBorder(borderSide: BorderSide(
                      color: Colors.grey.shade600
                  ),
                      borderRadius: BorderRadius.circular(10)),
                  hintText: 'Name',
                ),
                onChanged: (value) => controller.email.value = value,
              ),
            ),
            const SizedBox(height: 16.0),
            SizedBox(
              width: width * 1.5,
              height: 45,
              child: TextField(
                cursorColor: Colors.grey.shade600,
                style: textTheme.bodySmall,
                decoration: InputDecoration(
                  border:
                  OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey.shade500),
                      borderRadius: BorderRadius.circular(10)),
                  focusedBorder:
                  OutlineInputBorder(borderSide: BorderSide(
                      color: Colors.grey.shade600
                  ),
                      borderRadius: BorderRadius.circular(10)),
                  hintText: 'Email address or Username',
                ),
                onChanged: (value) => controller.email.value = value,
              ),
            ),
            const SizedBox(height: 16.0),
            Obx(()=> SizedBox(
              width: width * 1.5,
              height: 45,
              child: TextField(
                cursorColor: Colors.grey.shade600,
                style: textTheme.bodySmall,
                decoration: InputDecoration(
                    border:
                    OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey.shade500),
                        borderRadius: BorderRadius.circular(10)),
                    focusedBorder:
                    OutlineInputBorder(borderSide: BorderSide(
                        color: Colors.grey.shade600
                    ),
                        borderRadius: BorderRadius.circular(10)),
                    hintText: 'Password',
                    suffixIcon: IconButton(
                        onPressed: (){
                          controller.toggleObscured();
                        },
                        icon: Icon(
                          controller.isObscured.value ?
                          Icons.visibility_outlined
                              : Icons.visibility_off_outlined,
                          color: Colors.grey,
                        )
                    )

                ),
                obscureText: controller.isObscured.value,
                onChanged: (value) => controller.password.value = value,
              ),
            ),),
            const SizedBox(height: 16.0),
            Row(
              children: [
                Obx(() => Checkbox(
                      activeColor: AppColors.primary,
                      value: controller.rememberMe.value,
                      shape: RoundedRectangleBorder(borderRadius:BorderRadius.circular(5)),
                      onChanged: (value) => controller.toggleRememberMe(),
                    )),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [

                    const Text("I agree to the ",
                      style: TextStyle(color: Colors.black87,
                          fontSize: 12
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                      },
                      child: const Text(
                        "Terms & Policy",
                        style: TextStyle(
                            color: Colors.black,
                            decoration: TextDecoration.underline,
                            fontSize: 12
                        ),
                      ),
                    ),
                  ],
                ),
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
                    onPressed: () {},
                    child: Text('Signup',
                      style: textTheme.bodyMedium!.copyWith(
                          color: Colors.white,
                        fontWeight: FontWeight.bold,
                      )
                      ,),
                  )),
            ),
            const SizedBox(height: 45.0),
             Row(
              children: [
                const Expanded(child: Divider()),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Text('Or',style: textTheme.labelLarge),
                ),
                const Expanded(child: Divider()),
              ],
            ),
            const SizedBox(height: 45.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                width > 800 ?  ElevatedButton.icon(
                  onPressed: controller.signInWithGoogle,
                  icon: Assets.png.google.image(width: 20),
                  label: const Text('Sign in with Google'),
                  style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.black,
                      backgroundColor: Colors.white),
                ) : IconButton(
                  onPressed: controller.signInWithGoogle,
                  icon: Assets.png.google.image(width: 20),
                  style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.black,
                      backgroundColor: Colors.white),
                ),
                const SizedBox(width: 5.0),
                width > 800 ? ElevatedButton.icon(
                  onPressed: controller.signInWithApple,
                  icon:  Icon(
                    Icons.apple,
                    size: 30,
                    color: AppColors.primary,
                  ),
                  label:  Text(
                    'Sign in with Apple',
                    style: TextStyle(color: AppColors.primary),
                  ),
                  style:
                  ElevatedButton.styleFrom(backgroundColor: AppColors.secondary),
                ) : IconButton(
                  onPressed: controller.signInWithApple,
                  icon:  Icon(
                    Icons.apple,
                    size: 30,
                    color: AppColors.primary,
                  ),

                  style:
                  ElevatedButton.styleFrom(backgroundColor: AppColors.secondary),
                ),
              ],
            ),
            const SizedBox(height: 24.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                 Text(
                  'Have an account?',
                  style: textTheme.bodyMedium,
                ),
                  TextButton(
                    onPressed: controller.signIn,
                    child: Text('Sign In',
                      style: textTheme.bodySmall!.copyWith(color: Colors.blueAccent.shade700),
                    ))
              ],
            ),
          ],
        ),
      ),
    );
  }
}

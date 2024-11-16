import 'package:GreenWave/Core/Constants/app_colors.dart';
import 'package:GreenWave/Core/Constants/app_route.dart';
import 'package:GreenWave/Core/Services/response_model.dart';
import 'package:GreenWave/Features/Register/Mobile/RegisterPhone/register_mobile_register_phone_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:lottie/lottie.dart';

import '../../../../Core/Gen/assets.gen.dart';
import '../../../MainWrapper/DialogWrapper/wrapper_dialog_view.dart';
import '../../SwitchController/register_switch_controller.dart';

class RegisterMobileRegisterPhoneView extends GetView<RegisterMobileRegisterPhoneViewmodel> {
   RegisterMobileRegisterPhoneView({super.key});


  final TextEditingController password = TextEditingController();


  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.sizeOf(context).height;
    var width = MediaQuery.sizeOf(context).width;
    var textTheme = Theme.of(context).textTheme;
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              Obx(()=>AppBar(
                leading: Get.find<RegisterSwitchViewmodel>().position.value == true
                    ? IconButton(
                    onPressed: () {
                     controller.backPage();
                    },
                    icon: const Icon(
                        Icons.arrow_back_ios_new_rounded))
                    : null,
                automaticallyImplyLeading: false,
              ),),
              Lottie.asset(Assets.json.wave2, height: 250),
              SingleChildScrollView(
                padding:
                EdgeInsets.symmetric(horizontal: width < 900 ? 24.0 : 240.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 0.0),
                      child: Text(
                        true
                            ? 'Welcome back!'
                            : 'send your message!',
                        style: textTheme.headlineMedium,
                      ),
                    ),
                    const SizedBox(height: 8.0),
                    const Padding(
                      padding: EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 30.0),
                      child:
                      Text(
                          true ?
                              'Please enter your Password'
                            : 'We send code for verification in bot'
                      ),
                    ),
                    const SizedBox(height: 10.0),
                    SizedBox(
                      width: width * 1.5,
                      height: 45,
                      child:  true
                            ?  _TextFieldPassword(controller: controller)
                            : _TextFieldCode(controller: controller)
                      ),

      
                    const SizedBox(height: 40.0),
                    Center(
                      child: SizedBox(
                        width: width * 1.5,
                        height: 40,
                        child: Obx(() => ElevatedButton(
                          onPressed:  () async{
                             await controller.postPassword(controller.number.value);
                            if(controller.state.value.status == Status.COMPLETED){
                              Get.offAllNamed(AppRoute.mainWrapperBottomNavView);
                            }
                          },
                          style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10)),
                            backgroundColor:
                            const Color.fromRGBO(42, 101, 51, 1.0),
                          ),
                          child: AnimatedCrossFade(
                            firstChild:  Text(
                              'Next',
                              style: textTheme.bodyMedium!.copyWith(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            secondChild: LoadingAnimationWidget.dotsTriangle(
                                color: AppColors.secondary, size: 20),
                            crossFadeState: controller.state.value.status == Status.LOADING
                                ? CrossFadeState.showSecond
                                : CrossFadeState.showFirst,
                            duration: const Duration(milliseconds: 300),
                          ),)
                        ),),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _TextFieldCode extends StatelessWidget {
  const _TextFieldCode({
    super.key,
    required this.controller,
  });

  final RegisterMobileRegisterPhoneViewmodel controller;

  @override
  Widget build(BuildContext context) {
    return TextField(
      textAlign: TextAlign.center,
      cursorColor: Colors.grey.shade600,
      decoration: InputDecoration(
        border: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey.shade500),
            borderRadius: BorderRadius.circular(10)),
        focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey.shade600),
            borderRadius: BorderRadius.circular(10)),
        hintText: 'Enter Code',
      ),
      onChanged: (value) => controller.email.value = value,
    );
  }
}

class _TextFieldPassword extends StatelessWidget {
  const _TextFieldPassword({
    super.key,
    required this.controller,
  });

  final RegisterMobileRegisterPhoneViewmodel controller;

  @override
  Widget build(BuildContext context) {
    return Obx(()=>TextField(
      cursorColor: Colors.grey.shade600,
      decoration: InputDecoration(
          border: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.grey.shade500),
              borderRadius: BorderRadius.circular(10)),
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.grey.shade600),
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
              ))),
      obscureText: controller.isObscured.value,
      onChanged: (value) => controller.password.value = value,
    ));
  }
}



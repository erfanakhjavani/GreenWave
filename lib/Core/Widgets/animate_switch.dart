import 'package:GreenWave/Features/MainWrapper/DialogWrapper/DialogChoiceItem/dialog_choice_item_view.dart';
import 'package:GreenWave/Features/MainWrapper/DialogWrapper/wrapper_dialog_viewmodel.dart';
import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


import '../../Features/MainWrapper/DialogWrapper/DialogSendImage/dialog_send_image_view.dart';
import '../../Features/Register/Login/register_login_view.dart';
import '../../Features/Register/Mobile/PhoneNumber/register_mobile_phone_number_view.dart';
import '../../Features/Register/Mobile/RegisterPhone/register_mobile_register_phone_view.dart';
import '../../Features/Register/SignUp/register_signup_view.dart';
import '../../Features/Register/SwitchController/register_switch_controller.dart';


abstract class AbstractRegisterSwitchView<T extends GetxController>
    extends GetView<T> {
  const AbstractRegisterSwitchView({super.key});

  Widget widget1();
  Widget widget2();
  RxBool change();

  @override
  Widget build(BuildContext context) {
    return Obx(() => PageTransitionSwitcher(
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
      child: buildView(),
    ));
  }

  Widget buildView() {
    return change().value
        ? widget1()
        : widget2();
  }
}



class RegisterSwitchView extends AbstractRegisterSwitchView<RegisterSwitchViewmodel> {
  const RegisterSwitchView({super.key});

  @override
  Widget widget1() => const  RegisterSignupView();

  @override
  Widget widget2() => const RegisterLoginView();

  @override
  RxBool change() {
    return controller.position;
  }
}






class RegisterSwitchMobileView extends
AbstractRegisterSwitchView<RegisterSwitchViewmodel> {
  const RegisterSwitchMobileView({super.key});

  @override
  Widget widget2() =>  RegisterMobileView();

  @override
  Widget widget1() => const RegisterMobileRegisterPhoneView();

  @override
  RxBool change() {
    return controller.position;
  }
}




class SwitcherDialog extends
AbstractRegisterSwitchView<WrapperDialogViewmodel> {
  const SwitcherDialog({super.key});

  @override
  Widget widget1() => const DialogChoiceItemView();

  @override
  Widget widget2() => const DialogSendImageView();

  @override
  RxBool change() {
    return controller.showImageDialog;
  }
}



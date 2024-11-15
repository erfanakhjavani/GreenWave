import 'package:flutter/animation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'main_wrapper_wallet_model.dart';

class MainWrapperWalletViewmodel extends GetxController with GetTickerProviderStateMixin{
  late AnimationController animationController;
  late Animation<double> rotationAnimation;
  var isFront = true.obs;
  var balanceData = BalanceData(2365.20, [200, 300, 400, 500, 600]).obs;
  var transactions = [
    Transaction(name: "challenge claimed", date: "Today, 09:12", amount: 153.50, isIncome: true),
    Transaction(name: "Sent Transaction", date: "January 11, 2018", amount: 76.30, isIncome: false),
    Transaction(name: "Received Transaction", date: "December 25, 2017", amount: 125.80, isIncome: true),
    Transaction(name: "Sent Transaction", date: "December 25, 2017", amount: 123.20, isIncome: false),
    Transaction(name: "Sent Transaction", date: "December 25, 2017", amount: 400.32, isIncome: false),
    Transaction(name: "Received Transaction", date: "December 25, 2017", amount: 120.18, isIncome: true),

    // Add more transactions as needed
  ].obs;


  @override
  void onInit() {
    super.onInit();
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 800),
    );
    rotationAnimation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(parent: animationController, curve: Curves.easeInOut),
    );
  }

  void flipCard() {
    if (isFront.value) {
      animationController.forward();
    } else {
      animationController.reverse();
    }
    isFront.toggle();
  }

  @override
  void onClose() {
    animationController.dispose();
    super.onClose();
  }
}


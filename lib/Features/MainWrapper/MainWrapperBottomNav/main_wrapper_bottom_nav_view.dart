import 'package:GreenWave/Core/Constants/app_colors.dart';
import 'package:GreenWave/Features/MainWrapper/MainWrapperBottomNav/main_wrapper_bottom_nav_viewmodel.dart';
import 'package:GreenWave/Features/MainWrapper/MainWrapperHome/main_wrapper_home_view.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

import '../MainWrapperQuest/main_wrapper_quest_view.dart';
import '../MainWrapperWallet/main_wrapper_wallet_view.dart';
import 'main_wrapper_bottom_nav_model.dart';

class MainWrapperBottomNavView extends GetView<MainWrapperBottomNavViewmodel> {
  MainWrapperBottomNavView({super.key});

  final List<MainWrapperBottomNavModel> items = [
    MainWrapperBottomNavModel(
        title: 'Home',
        iconPath: FontAwesomeIcons.house,
        pageRoute: const MainWrapperHomeView()),
    MainWrapperBottomNavModel(
        title: 'Quest',
        iconPath: FontAwesomeIcons.questionCircle,
        pageRoute: const MainWrapperQuestView()),
    MainWrapperBottomNavModel(
        title: 'Wallet',
        iconPath: FontAwesomeIcons.wallet,
        pageRoute: MainWrapperWalletView()),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      bottomNavigationBar: Obx(() {
        return BottomNavigationBar(
          elevation: 0,
          selectedItemColor: AppColors.monopolyColor1,
          items: items.map((item) {
            return BottomNavigationBarItem(
              icon: Icon(item.iconPath),
              label: item.title,
            );
          }).toList(),
        );
      }),
    );
  }
}

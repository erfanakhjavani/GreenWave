import 'package:GreenWave/Core/Constants/app_colors.dart';
import 'package:GreenWave/Features/MainWrapper/MainWrapperBottomNav/main_wrapper_bottom_nav_viewmodel.dart';
import 'package:GreenWave/Features/MainWrapper/MainWrapperHome/main_wrapper_home_view.dart';
import 'package:GreenWave/Features/MainWrapper/MainWrapperProfile/main_wrapper_profile_view.dart';
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
        title: 'Quests',
        iconPath: FontAwesomeIcons.personCircleQuestion,
        pageRoute: const MainWrapperQuestView()),
    MainWrapperBottomNavModel(
        title: 'Wallet',
        iconPath: FontAwesomeIcons.wallet,
        pageRoute: MainWrapperWalletView()),
    MainWrapperBottomNavModel(
        title: 'Profile',
        iconPath: FontAwesomeIcons.userLarge,
        pageRoute:  const MainWrapperProfileView()),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() {
        return items[controller.selectedIndex.value].pageRoute;
      }),
      bottomNavigationBar: Obx(() {
        return BottomNavigationBar(
          currentIndex: controller.selectedIndex.value,
          onTap: controller.onTabSelected,
          elevation: 0,
          selectedItemColor: AppColors.monopolyColor2,
          unselectedItemColor: Colors.grey,
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

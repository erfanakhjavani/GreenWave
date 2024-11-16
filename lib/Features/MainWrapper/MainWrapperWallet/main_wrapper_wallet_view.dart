import 'package:GreenWave/Core/Constants/app_colors.dart';
import 'package:GreenWave/Core/Constants/app_route.dart';
import 'package:GreenWave/Features/MainWrapper/MainWrapperWallet/Analysis/wallet_analysis_view.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

import '../../../Core/Gen/assets.gen.dart';
import 'main_wrapper_wallet_viewmodel.dart';

class MainWrapperWalletView extends GetView<MainWrapperWalletViewmodel> {
  const MainWrapperWalletView({super.key});

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.sizeOf(context).width;
    var height = MediaQuery.sizeOf(context).height;

    return SafeArea(
      child: Scaffold(
        body: Center(
            child: Column(mainAxisSize: MainAxisSize.min, children: [
          Padding(
              padding: const EdgeInsets.all(15.0),
              child: _buildCard(
                width,
                height,
                image: Assets.jpg.cc.provider(),
              )),
          _buildActionIconsRows(),
          const Gap(20),
          Expanded(
            child: Card(
              color: Colors.white,
              child: ListView.builder(
                itemCount: controller.transactions.length,
                itemBuilder: (context, index) {
                  final transaction = controller.transactions[index];
                  return ListTile(
                    title: Text(transaction.name),
                    subtitle: Text(transaction.date),
                    trailing: Text(
                      "\$${transaction.amount}",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: transaction.isIncome ? Colors.green : Colors.red,
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        ])),
      ),
    );
  }

  Widget _buildCard(double width, double height, {required ImageProvider image}) {
    // تنظیم ابعاد کانتینر به صورت ریسپانسیو (نسبت به اندازه صفحه)
    double cardWidth = width * 0.8;  // 80% از عرض صفحه
    double cardHeight = height * 0.25;  // 25% از ارتفاع صفحه

    return Card(
      elevation: 8,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(15),
        child: Container(
          width: cardWidth,
          height: cardHeight,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: image,
              fit: BoxFit.fill,
            ),
          ),
        ),
      ),
    );
  }


  Widget _buildActionIcon(IconData icon, String label, VoidCallback onPressed) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        GestureDetector(
          onTap: onPressed, // اضافه کردن onPressed به آیکون
          child: Icon(icon, color: AppColors.monopolyColor2, size: 30),
        ),
        const SizedBox(height: 5),
        Text(label, style: TextStyle(color: AppColors.monopolyColor2)),
      ],
    );
  }

  Widget _buildActionIconsRows() {
    final icons = [
      Icons.arrow_upward,
      Icons.arrow_downward,
      Icons.attach_money_rounded,
      Icons.analytics_outlined,
    ];

    final labels = [
      "Send",
      "Receive",
      "Buy & Sell",
      "Analysis",
    ];

    final groups = List.generate(
      (icons.length / 4).ceil(),
          (index) => icons.skip(index * 4).take(4).toList(),
    );

    final labelGroups = List.generate(
      (labels.length / 4).ceil(),
          (index) => labels.skip(index * 4).take(4).toList(),
    );

    return Column(
      children: List.generate(groups.length, (index) {
        final iconGroup = groups[index];
        final labelGroup = labelGroups[index];

        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: List.generate(4, (i) {
              if (i < iconGroup.length) {
                return Expanded(
                  child: _buildActionIcon(
                    iconGroup[i],
                    labelGroup[i],
                        () {
                      switch (labelGroup[i]) {
                        case "Send":
                          Get.to('sendRoute');
                          break;
                        case "Receive":
                          Get.to('receiveRoute');
                          break;
                        case "Buy & Sell":
                          Get.to('buySellRoute');
                          break;
                        case "Analysis":
                          Get.to(const WalletAnalysisView());
                          break;
                      }
                    },
                  ),
                );
              } else {
                return const Expanded(child: SizedBox());
              }
            }),
          ),
        );
      }),
    );
  }


}

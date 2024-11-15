import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

import '../../../Core/Gen/assets.gen.dart';
import 'main_wrapper_wallet_viewmodel.dart';

class MainWrapperWalletView extends StatelessWidget {
   MainWrapperWalletView({super.key});

  MainWrapperWalletViewmodel controller = MainWrapperWalletViewmodel();
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.sizeOf(context).width;
    var height = MediaQuery.sizeOf(context).height;

    return SafeArea(
      child: Scaffold(
        body: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.green.shade900, Colors.green.shade300],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
          child: Center(
            child: Stack(
              children: [
                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: GestureDetector(
                          onHorizontalDragEnd: (_) => controller.flipCard(),
                          child: AnimatedBuilder(
                            animation: controller.rotationAnimation,
                            builder: (context, child) {
                              double rotationValue =
                                  controller.rotationAnimation.value * 180;
                              bool isFront = rotationValue <= 90;
                              return Transform(
                                transform: Matrix4.identity()
                                  ..setEntry(3, 2, 0.001)
                                  ..rotateY(
                                      rotationValue / 180 * 3.1415926535897932),
                                alignment: Alignment.center,
                                child: isFront
                                    ? _buildCard(
                                        width,
                                        height,
                                        image: Assets.jpg.cc.provider(),
                                      )
                                    : Transform(
                                        transform: Matrix4.identity()
                                          ..rotateY(3.1415926535897932),
                                        alignment: Alignment.center,
                                        child: _buildCard(
                                          width,
                                          height,
                                          image: Assets.jpg.intro2.provider(),
                                        ),
                                      ),
                              );
                            },
                          )),
                    ),
                    const Gap(20),
                    _buildActionIconsRows()
                  ],
                ),
                DraggableScrollableSheet(
                  initialChildSize: 0.46,
                  minChildSize: 0.45,
                  maxChildSize: 1,
                  builder: (context, scrollController) {
                    return Container(
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius:
                            BorderRadius.vertical(top: Radius.circular(16)),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black26,
                            blurRadius: 20,
                            spreadRadius: 2,
                          ),
                        ],
                      ),
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              height: 4,
                              width: 40,
                              color: Colors.grey.shade400,
                            ),
                          ),
                          Expanded(
                            child: ListView.builder(
                              controller: scrollController,
                              itemCount: controller.transactions.length,
                              itemBuilder: (context, index) {
                                final transaction =
                                    controller.transactions[index];
                                return ListTile(
                                  title: Text(transaction.name),
                                  subtitle: Text(transaction.date),
                                  trailing: Text(
                                    "\$${transaction.amount}",
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                      color: transaction.isIncome
                                          ? Colors.green
                                          : Colors.red,
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildCard(double width, double height,
      {required ImageProvider image}) {
    return Card(
      elevation: 8,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(15),
        child: Container(
          width: width / 1.1,
          height: height / 4,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: image,
              fit: BoxFit.fill,
            ),
          ),
          child: const Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: EdgeInsets.only(bottom: 12.0),
                child: Icon(
                  Icons.flip_outlined,
                  color: Colors.white,
                  size: 30,
                ),
              )),
        ),
      ),
    );
  }

  Widget _buildActionIcon(IconData icon, String label) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Icon(icon, color: Colors.white, size: 30),
        const SizedBox(height: 5), // فاصله بین آیکون و متن
        Text(label, style: const TextStyle(color: Colors.white)),
      ],
    );
  }

  Widget _buildActionIconsRows() {
    final icons = [
      Icons.arrow_upward,
      Icons.arrow_downward,
      Icons.attach_money_rounded,
      Icons.qr_code_scanner,
      Icons.analytics_outlined,
      Icons.handshake_outlined,
    ];

    final labels = [
      "Send",
      "Receive",
      "Buy & Sell",
      "Scan",
      "Analysis",
      "Donate",
    ];

    final groups = List.generate(
      (icons.length / 3).ceil(),
      (index) => icons.skip(index * 3).take(3).toList(),
    );

    final labelGroups = List.generate(
      (labels.length / 3).ceil(),
      (index) => labels.skip(index * 3).take(3).toList(),
    );

    return Column(
      children: List.generate(groups.length, (index) {
        final iconGroup = groups[index];
        final labelGroup = labelGroups[index];

        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: List.generate(3, (i) {
              if (i < iconGroup.length) {
                return Expanded(
                  child: _buildActionIcon(iconGroup[i], labelGroup[i]),
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

import 'package:GreenWave/Core/Constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:fl_chart/fl_chart.dart';

import 'main_wrapper_wallet_viewmodel.dart';

class MainWrapperWalletView extends StatelessWidget {
  final BalanceViewModel controller = Get.put(BalanceViewModel());

   MainWrapperWalletView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(),
        body: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.green.shade900, Colors.green.shade300],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
          child: Center(
            child: Obx(() {
              return Stack(
                children: [
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Card(
                        margin: const EdgeInsets.all(0),
                        elevation: 8,
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(
                              bottomRight: Radius.circular(16),
                              bottomLeft: Radius.circular(16),

                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                'Total Balance',
                                style: TextStyle(fontSize: 18, color: Colors.grey.shade700),
                              ),
                              const SizedBox(height: 8),
                              AnimatedSwitcher(
                                duration: const Duration(milliseconds: 500),
                                transitionBuilder: (child, animation) =>
                                    ScaleTransition(scale: animation, child: child),
                                child: Text(
                                  '\$${controller.balanceData.value.totalBalance.toStringAsFixed(2)}',
                                  key: ValueKey(controller.balanceData.value.totalBalance),
                                  style: TextStyle(
                                    fontSize: 32,
                                    fontWeight: FontWeight.bold,
                                    foreground: Paint()
                                      ..shader = LinearGradient(
                                        colors: <Color>[
                                          AppColors.monopolyColor2,
                                          AppColors.monopolyColor1
                                        ],
                                      ).createShader(
                                        const Rect.fromLTWH(0.0, 0.0, 200.0, 70.0),
                                      ),
                                    shadows: [
                                      Shadow(
                                        blurRadius: 10.0,
                                        color: Colors.black.withOpacity(0.2),
                                        offset: const Offset(2, 4),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              const SizedBox(height: 20),
                              SizedBox(
                                height: 200,
                                child: LineChart(
                                  LineChartData(
                                    gridData: const FlGridData(show: false),
                                    titlesData: const FlTitlesData(show: false),
                                    borderData: FlBorderData(show: false),
                                    lineBarsData: [
                                      LineChartBarData(
                                        spots: controller.balanceData.value.chartData
                                            .asMap()
                                            .entries
                                            .map((e) => FlSpot(e.key.toDouble(), e.value))
                                            .toList(),
                                        isCurved: true,
                                        color: Colors.blueGrey,
                                        barWidth: 4,
                                        belowBarData: BarAreaData(
                                          show: true,
                                          color: Colors.green.withOpacity(0.3),
                                        ),
                                        dotData: const FlDotData(show: true),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          _buildActionIcon(Icons.arrow_upward, "Send",),
                          _buildActionIcon(Icons.arrow_downward, "Receive"),
                          _buildActionIcon(Icons.attach_money_rounded, "Buy"),
                        ],
                      ),
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
                          borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
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
                          ],
                        ),
                      );
                    },
                  ),
                ],
              );
            }),
          ),
        ),
      ),
    );
  }

  Widget _buildActionIcon(IconData icon, String label) {
    return Wrap(
      children: [
        Icon(icon, color: Colors.white, size: 32,opticalSize: 12,),
        const SizedBox(height: 4),
        Text(label, style: const TextStyle(color: Colors.white)),
      ],
    );
  }
}

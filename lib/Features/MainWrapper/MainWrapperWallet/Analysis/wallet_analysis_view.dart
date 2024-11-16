import 'package:GreenWave/Core/Constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:fl_chart/fl_chart.dart';

import '../main_wrapper_wallet_viewmodel.dart';


class WalletAnalysisView extends GetView<MainWrapperWalletViewmodel> {


  const WalletAnalysisView({super.key});

  @override
  Widget build(BuildContext context) {
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
            child: Obx(() {
              return Stack(
                children: [
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Card(
                        elevation: 8,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Align(
                                alignment: Alignment.topLeft,
                                child: IconButton(onPressed: (){
                                  Get.back();
                                },
                                  icon: const Icon(
                                    Icons.arrow_back,
                                    color: Colors.black87,)),
                              ),
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
                      ),]
              ),
                  DraggableScrollableSheet(
                    initialChildSize: 0.50,
                    minChildSize: 0.50,
                    maxChildSize: 1,
                    builder: (context, scrollController) {
                      return Container(
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black26,
                              blurRadius: 10,
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
                                        fontSize: 14,
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

}
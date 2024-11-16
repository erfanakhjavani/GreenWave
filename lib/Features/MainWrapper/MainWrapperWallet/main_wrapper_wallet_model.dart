import 'package:get/get.dart';

class MainWrapperWalletModel {
  final double totalBalance;
  final List<double> chartData;
  MainWrapperWalletModel(this.totalBalance, this.chartData);
}

class Transaction {
  final String name;
  final String date;
  final double amount;
  final bool isIncome;

  Transaction({
    required this.name,
    required this.date,
    required this.amount,
    required this.isIncome,
  });
}
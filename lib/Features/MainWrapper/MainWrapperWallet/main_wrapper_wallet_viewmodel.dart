
import 'package:get/get.dart';

import 'main_wrapper_wallet_model.dart';

class MainWrapperWalletViewmodel extends GetxController{
  var isFront = true.obs;
  var balanceData = MainWrapperWalletModel(2365.20, [200, 300, 400, 500, 600]).obs;
  var transactions = [
    Transaction(name: "challenge claimed",
        date: "Today, 09:12",
        amount: 153.50,
        isIncome: true),
    Transaction(name: "Sent Transaction",
        date: "January 11, 2018",
        amount: 76.30,
        isIncome: false),
    Transaction(name: "Received Transaction",
        date: "December 25, 2017",
        amount: 125.80,
        isIncome: true),
    Transaction(name: "Sent Transaction",
        date: "December 25, 2017",
        amount: 123.20,
        isIncome: false),
    Transaction(name: "Sent Transaction",
        date: "December 25, 2017",
        amount: 400.32,
        isIncome: false),
    Transaction(name: "Received Transaction",
        date: "December 25, 2017",
        amount: 120.18,
        isIncome: true),
  ].obs;


}
import 'package:GreenWave/Core/Constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import '../../../Core/Gen/assets.gen.dart';
import 'main_wrapper_wallet_model.dart';
import 'main_wrapper_wallet_viewmodel.dart';


class MainWrapperWalletView extends StatelessWidget {
   MainWrapperWalletView({super.key});

  final MainWrapperWalletViewmodel viewModel = Get.put(MainWrapperWalletViewmodel());

  final List<MainWrapperWalletModel> tokens = [
    MainWrapperWalletModel(
      name: 'Bitcoin',
      symbol: 'BTC',
      amount: '19.2371',
      price: '\$73.69',
      change: '+2%',
      iconPath: Assets.png.btc.path,
    ),
    MainWrapperWalletModel(
      name: 'USD Tether',
      symbol: 'USDT',
      amount: '92.3',
      price: '\$1.00',
      change: '+4.3%',
      iconPath: Assets.png.usat.path,
    ),
    MainWrapperWalletModel(
      name: 'Synthetix',
      symbol: 'SNX',
      amount: '42.74',
      price: '\$20.83',
      change: '-1.3%',
      iconPath: Assets.png.snx.path,
    ),
  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: const Text(
          'Wallet',
        ),
        leading: null,
        actions:  [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: CircleAvatar(
              backgroundImage: AssetImage(Assets.png.logo.path),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              '9.2362 ETH',
              style: TextStyle( fontSize: 36),
            ),
            const Text(
              '\$16,858.15',
              style: TextStyle( fontSize: 16),
            ),
            const Text(
              '+0.7%',
              style: TextStyle(color: Colors.green, fontSize: 16),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton.icon(
                  onPressed: () {},
                  icon: const Icon(FontAwesomeIcons.paperPlane, color: Colors.white),
                  label: const Text('Send',style: TextStyle(color: Colors.white),),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.grey[800],
                    shape: const StadiumBorder(),
                  ),
                ),
                ElevatedButton.icon(
                  onPressed: () {},
                  icon: const Icon(FontAwesomeIcons.download, color: Colors.white),
                  label: const Text('Receive',style: TextStyle(color: Colors.white),),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.grey[800],
                    shape: const StadiumBorder(),
                  ),
                ),
                ElevatedButton.icon(
                  onPressed: () {},
                  icon: const Icon(FontAwesomeIcons.shoppingCart, color: Colors.white),
                  label: const Text('Buy',style: TextStyle(color: Colors.white),),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.grey[800],
                    shape: const StadiumBorder(),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Obx(() => Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton(
                  onPressed: () {
                    viewModel.selectedTab.value = 'Token';
                  },
                  child: Text(
                    'Token',
                    style: TextStyle(
                      color: viewModel.selectedTab.value == 'Token' ? AppColors.monopolyColor1 : AppColors.primary,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                TextButton(
                  onPressed: () {
                    viewModel.selectedTab.value = 'Collectibles';
                  },
                  child: Text(
                    'Collectibles',
                    style: TextStyle(
                      color: viewModel.selectedTab.value == 'Token' ? AppColors.primary : AppColors.monopolyColor1,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            )),
            Expanded(
              child: ListView.builder(
                itemCount: tokens.length,
                itemBuilder: (context, index) {
                  final token = tokens[index];
                  return ListTile(
                    leading: Image.asset(token.iconPath, width: 40),
                    title: Text(token.name),
                    subtitle: Text(token.price + ' • ' + token.change, style: TextStyle(color: token.change.startsWith('+') ? Colors.green : Colors.red)),
                    trailing: Text(token.amount + ' ' + token.symbol, style: const TextStyle(fontSize: 12)),
                  );
                },
              ),
            ),
            Center(
              child: TextButton(
                onPressed: () {},
                child: const Text('+ Add Tokens', style: TextStyle(color: Colors.blue)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

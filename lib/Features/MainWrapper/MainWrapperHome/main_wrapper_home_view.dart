import 'package:GreenWave/Core/Data/Repositories/storage_repository.dart';
import 'package:GreenWave/Core/Gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';

import '../../../Core/Constants/app_colors.dart';
import '../DialogWrapper/wrapper_dialog_view.dart';
import 'main_wrapper_home_viewmodel.dart';

class MainWrapperHomeView extends GetView<MainWrapperHomeViewmodel> {
  const MainWrapperHomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: null,
        backgroundColor: Colors.white,
        elevation: 0,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Text(
                  'GREEN',
                  style: TextStyle(
                    color: AppColors.monopolyColor1,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  'Wave',
                  style: TextStyle(
                    color: AppColors.monopolyColor1,
                    fontSize: 19,
                    fontWeight: FontWeight.w300,
                  ),
                ),
              ],
            ),
            Row(
              children: [
                IconButton(
                  icon: Icon(Icons.notifications,
                      color: AppColors.monopolyColor1),
                  onPressed: () {
                    DataRepository().deleteData('codeRD');
                  },
                ),
                IconButton(
                  icon: Icon(Icons.email, color: AppColors.monopolyColor1),
                  onPressed: () {
                  },
                ),
              ],
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 20),
              Row(
                children: [
                  _buildAvatar(
                      imagePath: Assets.png.logo.path, index: 0, size: 50),
                  const SizedBox(width: 20),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Hi, Saeed',
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: AppColors.monopolyColor1,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        'LEVEL 4',
                        style: TextStyle(
                          fontSize: 16,
                          color: AppColors.monopolyColor1,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Stack(
                        children: [
                          Container(
                            width: 150,
                            height: 10,
                            decoration: BoxDecoration(
                              color: Colors.grey[300],
                              borderRadius: BorderRadius.circular(5),
                            ),
                          ),
                          Container(
                            width: 60, // میزان پیشرفت
                            height: 10,
                            decoration: BoxDecoration(
                              color: AppColors.monopolyColor1,
                              borderRadius: BorderRadius.circular(5),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 4),
                      Text(
                        '10/100',
                        style: TextStyle(color: AppColors.monopolyColor1),
                      ),
                    ],
                  ),
                  const Spacer(),
                  Image.asset(
                    Assets.png.logo.path,
                    width: 50,
                    height: 50,
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  _buildAvatar(
                      imagePath: Assets.png.logo.path, index: 1, size: 25),
                  _buildAvatar(
                      imagePath: Assets.png.logo.path, index: 2, size: 25),
                  _buildAvatar(
                      imagePath: Assets.png.logo.path, index: 3, size: 25),
                  _buildAvatar(
                      imagePath: Assets.png.logo.path, index: 4, size: 25),
                  const SizedBox(width: 10),
                  CircleAvatar(
                    radius: 25,
                    backgroundColor: Colors.grey[300],
                    child: Icon(Icons.add, color: AppColors.monopolyColor1),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              TextField(
                decoration: InputDecoration(
                  hintText: 'Search People...',
                  filled: true,
                  fillColor: Colors.grey[200],
                  prefixIcon:
                      Icon(Icons.search, color: AppColors.monopolyColor1),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
              const SizedBox(height: 20),
              _buildGreenBox(),
              const SizedBox(height: 10),
              _buildGreenBox(),
              const SizedBox(height: 40),

            ],
          ),
        ),
      ),
    );
  }

  Widget _buildAvatar(
      {required String imagePath, required int index, required double size}) {
    return Padding(
      padding: const EdgeInsets.only(left: 6.0, right: 4.0, top: 10, bottom: 8),
      child: GestureDetector(
        onTap: () {
          controller.toggleAvatarClicked(index);
        },
        child: Obx(() {
          Color borderColor = controller.avatarBorderColor(index);
          bool isLoading = controller.isLoading[index];
          return Stack(
            alignment: Alignment.center,
            children: [
              if (isLoading)
                SpinKitRing(
                  color: AppColors.monopolyColor1,
                  size: size == 25 ? 60 : 110,
                  lineWidth: 2.0,
                ),
              Container(
                padding: const EdgeInsets.all(3.0),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: isLoading ? Colors.transparent : borderColor,
                    width: 2.0,
                  ),
                ),
                child: CircleAvatar(
                  radius: size,
                  backgroundImage: AssetImage(imagePath),
                ),
              )
            ],
          );
        }),
      ),
    );
  }

  Widget _buildGreenBox() {
    return Container(
      height: 100,
      decoration: BoxDecoration(
        color: AppColors.monopolyColor1,
        borderRadius: BorderRadius.circular(20),
      ),
    );
  }

}

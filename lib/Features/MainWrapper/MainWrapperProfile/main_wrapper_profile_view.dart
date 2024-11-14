import 'package:GreenWave/Core/Gen/assets.gen.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

import '../../../Core/Constants/app_colors.dart';
import 'main_wrapper_profile_viewmodel.dart';

class MainWrapperProfileView extends GetView<MainWrapperProfileViewmodel> {
  const MainWrapperProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawerDragStartBehavior: DragStartBehavior.start,
     drawerEdgeDragWidth: Get.width / 1,
     drawer: Drawer(
        width: Get.width / 1.3,
      ),
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
                  'erfanakhjavani',
                  style: TextStyle(
                    color: AppColors.monopolyColor2,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            Row(
              children: [
                IconButton(
                  icon: Icon(FontAwesomeIcons.pagelines,
                      color: AppColors.monopolyColor2,size: 30,),
                  onPressed: () {},
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
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  _buildAvatar(imagePath: Assets.jpg.erfan.path, index: 0, size: 50),
                  _buildStatsRow(),
                ],
              ),
              const Text(
                'Erfan',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black87,
                ),
              ),
              Text(
                'Mobile Application Development',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey[800],
                ),
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  _buildAvatar(imagePath: Assets.png.logo.path, index: 1, size: 25),
                  _buildAvatar(imagePath: Assets.png.logo.path, index: 2, size: 25),
                  _buildAvatar(imagePath: Assets.png.logo.path, index: 3, size: 25),
                  _buildAvatar(imagePath: Assets.png.logo.path, index: 4, size: 25),
                  const SizedBox(width: 10),
                  CircleAvatar(
                    radius: 25,
                    backgroundColor: Colors.grey[300],
                    child: Icon(Icons.add, color: AppColors.monopolyColor1),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              DefaultTabController(
                length: 2,
                child: Column(
                  children: [
                    TabBar(
                      indicatorColor: AppColors.monopolyColor2,
                      labelColor: AppColors.monopolyColor2,
                      unselectedLabelColor: Colors.grey,
                      tabs: const [
                        Tab(text: 'Posts'),
                        Tab(text: 'Task Complete'),
                      ],
                    ),
                    SizedBox(
                      height: 400,
                      child: TabBarView(
                        children: [
                          _buildPostsTab(),
                          _buildMentionsTab(),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildStatsRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Gap(30),
        _buildStat('Team', '32'),
        const Gap(20),
        _buildStat('Followers', '12.3K'),
        const Gap(30),
        _buildStat('Following', '245'),


      ],
    );
  }

  Widget _buildStat(String label, String count) {
    return Column(
      children: [
        Text(
          count,
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: AppColors.monopolyColor2,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          label,
          style: TextStyle(
            fontSize: 14,
            color: Colors.grey[600],
          ),
        ),
      ],
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

  Widget _buildPostsTab() {
    return const Center(child: Text("Capture moment of help the Nature"));
  }

  Widget _buildMentionsTab() {
    return const Center(child: Text("Mentions Content"));
  }
}

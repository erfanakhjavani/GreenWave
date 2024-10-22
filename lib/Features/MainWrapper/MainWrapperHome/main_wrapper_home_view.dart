import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import '../../../Core/Constants/app_colors.dart';
import 'main_wrapper_home_viewmodel.dart';

class MainWrapperHomeView extends GetView<MainWrapperHomeViewmodel> {
  const MainWrapperHomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title:  Row(
          children: [
            Text(
              'GREEN',
              style: TextStyle(
                color: AppColors.primary,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              'Wave',
              style: TextStyle(
                color: AppColors.primary,
                fontSize: 19,
                fontWeight: FontWeight.w300,
              ),
            ),
          ],
        ),
        actions: [
          IconButton(
            icon:  Icon(Icons.notifications, color: AppColors.primary),
            onPressed: () {},
          ),
          IconButton(
            icon:  Icon(Icons.email, color: AppColors.primary),
            onPressed: () {},
          ),
        ],
      ),
      body: Padding(
        padding:  const EdgeInsets.symmetric(horizontal: 16.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 20),
              Row(
                children: [
                  _buildAvatar(imagePath: 'assets/png/logo.png',
                      index: 0,
                      size: 50
                  ),
                  const SizedBox(width: 20),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Hi, Saeed',
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: AppColors.primary,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        'LEVEL 4',
                        style: TextStyle(
                          fontSize: 16,
                          color: AppColors.primary,
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
                              color: AppColors.primary,
                              borderRadius: BorderRadius.circular(5),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 4),
                      Text(
                        '10/100',
                        style: TextStyle(color: AppColors.primary),
                      ),
                    ],
                  ),
                  const Spacer(),
                  Image.asset(
                    'assets/png/logo.png',
                    width: 50,
                    height: 50,
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  _buildAvatar(imagePath: 'assets/png/logo.png',
                      index: 1,
                      size: 25
                  ),_buildAvatar(imagePath: 'assets/png/logo.png',
                      index: 2,
                      size: 25
                  ),_buildAvatar(imagePath: 'assets/png/logo.png',
                      index: 3,
                      size: 25
                  ),_buildAvatar(imagePath: 'assets/png/logo.png',
                      index: 4,
                      size: 25
                  ),
                  const SizedBox(width: 10),
                  CircleAvatar(
                    radius: 25,
                    backgroundColor: Colors.grey[300],
                    child:  Icon(Icons.add, color: AppColors.primary),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              TextField(
                decoration: InputDecoration(
                  hintText: 'Search People...',
                  filled: true,
                  fillColor: Colors.grey[200],
                  prefixIcon:  Icon(Icons.search, color: AppColors.primary),
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
              _buildProfileCard(),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildAvatar({required String imagePath,
    required int index,
    required double size,
  }) {
    return Padding(
      padding: const EdgeInsets.only(left: 6.0,right: 4.0,top: 10,bottom: 8),
      child: GestureDetector(
        onTap: () {
          controller.toggleAvatarClicked(index); // تغییر وضعیت کلیک
        },
        child: Obx(() {
          Color borderColor =
          controller.avatarBorderColor(index); // تعیین رنگ بر اساس وضعیت کلیک
          bool isLoading =
          controller.isLoading[index]; // وضعیت لودینگ برای هر آواتار
          return Stack(
            alignment: Alignment.center,
            children: [
              if(isLoading)
                SpinKitRing(
                  color: AppColors.primary,
                  size: size ==  25 ? 60 : 110, // اندازه انیمیشن
                  lineWidth: 2.0,
                ),
              Container(
                padding:  const EdgeInsets.all(3.0), // فاصله بین آواتار و حلقه
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: isLoading ?   Colors.transparent : borderColor,
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
        color: AppColors.primary,
        borderRadius: BorderRadius.circular(20),
      ),
    );
  }

  Widget _buildProfileCard() {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          padding:  const EdgeInsets.all(16.0),
          decoration: BoxDecoration(
            color:  const Color.fromRGBO(80, 86, 74, 1.0),
            borderRadius: BorderRadius.circular(20),
          ),
          child:  const Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 40),
              Text(
                'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc vulputate libero et velit interdum.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 12,
                ),
              ),
              Text(
                'Executive Engineer',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              SizedBox(height: 10),
              Text(
                'Rick Wright',
                style: TextStyle(
                  color: Colors.orange,
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
            ],
          ),
        ),
        Positioned(
          top: -30,
          left: Get.width / 2.5,
          child:  const CircleAvatar(
            radius: 30,
            backgroundColor: Colors.orange,
            child: Icon(Icons.person, size: 30, color: Colors.white),
          ),
        ),
      ],
    );
  }
}
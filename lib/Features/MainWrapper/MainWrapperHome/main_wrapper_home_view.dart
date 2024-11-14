import 'package:GreenWave/Core/Gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

import '../../../Core/Constants/app_colors.dart';
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
        actions: [
          Padding(
            padding: const EdgeInsets.only(
                left: 8.0,top: 10),
            child: IconButton(onPressed: (){}, icon: FaIcon(FontAwesomeIcons.message,color: AppColors.monopolyColor2,)),
          )
        ],
        elevation: 0,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Text(
                  'GREEN',
                  style: TextStyle(
                    color: AppColors.monopolyColor2,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  'Wave',
                  style: TextStyle(
                    color: AppColors.monopolyColor2,
                    fontSize: 19,
                    fontWeight: FontWeight.w300,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 10),
            SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: _buildStoryRow()),
            const SizedBox(height: 10),
            _buildPostsList(),
          ],
        ),
      ),
    );
  }

  Widget _buildStoryRow() {
    int storyCount = 4;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          _buildUserStory(
            imagePath: Assets.jpg.erfan.path,
            index: 0,
            isCurrentUser: true,
          ),
          for (int i = 1; i < storyCount; i++)
            _buildUserStory(
              imagePath: 'assets/jpg/intro$i.jpg',
              index: i,
            ),
        ],
      ),
    );
  }

  Widget _buildUserStory({
    required String imagePath,
    required int index,
    bool isCurrentUser = false,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4.0),
      child: GestureDetector(
        onTap: () {
        },
        child: Column(
          children: [
            Stack(
              clipBehavior: Clip.none,
              alignment: Alignment.bottomRight,
              children: [
                _buildAvatar(imagePath: imagePath,
                    avatarSize: 30,
                    index: index, size: 70),
                if (isCurrentUser)
                  Positioned(
                    bottom: -10,
                    left: 23,
                    child: Container(
                      decoration:  BoxDecoration(
                        shape: BoxShape.circle,
                        color: AppColors.monopolyColor2,
                        border: Border.all(width: 2,color: Colors.white)
                      ),
                      child: const Icon(Icons.add, color: Colors.white, size: 20),
                    ),
                  ),
              ],
            ),
            const SizedBox(height: 10),
            Text(
              isCurrentUser ? 'your think' : 'User $index',
              style: TextStyle(color: Colors.grey[700],
              fontSize: 15
              ),
            ),
          ],
        ),
      ),
    );
  }


  Widget _buildPostsList() {
    return
        ListView.builder(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: 10,
          itemBuilder: (context, index) {
            return _buildPostItem(index);
          },
        );
  }

  Widget _buildPostItem(int index) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical:.0,horizontal: .0),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      elevation: 5,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildRowAvatarPost(index: index),
          const Gap(10),
          Image.asset(
            Assets.jpg.intro1.path,
            fit: BoxFit.cover,
            height: 200,
            width: double.infinity,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Obx(()=>Row(
                  children: [
                    IconButton(
                      icon: Icon(
                        controller.isPostLiked[index]
                            ? Icons.favorite
                            : Icons.favorite_border,
                        color: const Color.fromRGBO(255, 215, 0, 1.0),
                      ),
                      onPressed: () => controller.toggleLike(index),
                    ),
                    Text(controller.postLikes[index].toString()),
                    const SizedBox(width: 8),
                    IconButton(
                      icon: Icon(
                        controller.isPostDisliked[index]
                            ? Icons.favorite
                            : Icons.favorite_border,
                        color: const Color.fromRGBO(87, 18, 18, 1.0),
                      ),
                      onPressed: () => controller.toggleDislike(index),
                    ),
                    Text(controller.postDislikes[index].toString()),
                  ],
                ),),
                IconButton(
                  icon: Icon(Icons.share, color: AppColors.monopolyColor1),
                  onPressed: () {},
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }


  Widget _buildRowAvatarPost({required int index}){
    return  Row(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: _buildAvatar(
               index: 0, imagePath: Assets.jpg.erfan.path,
                avatarSize: 20,
                size: 50,
            ),
          ),
        const Text('erfanakhjavani')
      ],
    );
  }

  Widget _buildAvatar(
      {required String imagePath,
        required int index,
        required double size,
        required double avatarSize,
      }) {
    return GestureDetector(
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
                size: size ,
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
                radius: avatarSize,
                backgroundImage: AssetImage(imagePath),
              ),
            )
          ],
        );
      }),
    );
  }

}
import 'package:GreenWave/Features/MainWrapper/DialogWrapper/wrapper_dialog_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gap/gap.dart';
import '../../../Core/Gen/assets.gen.dart';
import '../../../Core/UIHelper/show_modal_bottom_sheet.dart';
import 'main_wrapper_quest_model.dart';
import 'main_wrapper_quest_viewmodel.dart';

class MainWrapperQuestView extends StatelessWidget {
  const MainWrapperQuestView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          'Quests and challenges',
          style: TextStyle(
            color: Colors.black,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.help_outline, color: Colors.black),
            onPressed: () {

            },
          ),
        ],
      ),
      body: GetBuilder<MainWrapperQuestViewModel>(
        init: MainWrapperQuestViewModel(),
        builder: (controller) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: ListView.builder(
              itemCount: controller.quests.length,
              itemBuilder: (context, index) {
                final quest = controller.quests[index];
                return QuestCard(
                  quest: quest,
                  onTap: () {
                    index == 0
                        ? showWrapperDialog(context)
                        : showCustomModalBottomSheet(
                      imagePath: Assets.png.google.path,
                      description: quest.isCompleted
                          ? 'challenge completed!'
                          : quest.description,
                      buttonText: 'ok',
                      onButtonPressed: () {
                        Get.back();
                      },
                    );
                    controller.toggleQuestCompletion(index);

                  },
                );
              },
            ),
          );
        },
      ),
    );
  }
}

class QuestCard extends StatelessWidget {
  final MainWrapperQuestModel quest;
  final VoidCallback onTap;

  const QuestCard({
    super.key,
    required this.quest,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.only(bottom: 16.0),
        padding: const EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 8,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Row(
          children: [
            Icon(
              quest.isCompleted ? Icons.check_circle : Icons.radio_button_unchecked,
              color: quest.isCompleted ? Colors.green : Colors.grey,
              size: 30,
            ),
            const Gap(16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    quest.title,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  const Gap(8),
                  Text(
                    quest.description,
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey[700],
                    ),
                  ),
                ],
              ),
            ),
            const Gap(16),
            const Icon(
              Icons.arrow_forward_ios,
              color: Colors.grey,
              size: 20,
            ),
          ],
        ),
      ),
    );
  }
}

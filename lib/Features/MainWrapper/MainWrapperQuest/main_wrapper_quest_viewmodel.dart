import 'package:get/get.dart';

import 'main_wrapper_quest_model.dart';

class MainWrapperQuestViewModel extends GetxController {
  var quests = <MainWrapperQuestModel>[
    MainWrapperQuestModel(title: 'First challenge', description: 'Description of the first challenge'),
    MainWrapperQuestModel(title: 'Second challenge', description: 'Description of the second challenge'),
    MainWrapperQuestModel(title: 'Third challenge', description: 'Description of the third challenge'),
  ].obs;

  void toggleQuestCompletion(int index) {
    quests[index].isCompleted = !quests[index].isCompleted;
    update();
  }
}

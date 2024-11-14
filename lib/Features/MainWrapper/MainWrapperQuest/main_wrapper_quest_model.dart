class MainWrapperQuestModel {
  final String title;
  final String description;
  bool isCompleted;

  MainWrapperQuestModel({
    required this.title,
    required this.description,
    this.isCompleted = false,
  });
}
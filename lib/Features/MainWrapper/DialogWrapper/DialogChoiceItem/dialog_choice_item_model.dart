class DialogChoiceItemModel {
  final int step;
  final String title;

  DialogChoiceItemModel({
    required this.step,
    required this.title,
  });

  factory DialogChoiceItemModel.fromJson(Map<String, dynamic> json) {
    return DialogChoiceItemModel(
      step: json['step'] ?? 0,
      title: json['title'] ?? '',
    );
  }
}
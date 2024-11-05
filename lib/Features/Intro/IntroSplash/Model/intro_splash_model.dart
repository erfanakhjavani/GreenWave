import 'package:hive/hive.dart';
part 'intro_splash_model.g.dart';

@HiveType(typeId: 0)
class IntroSplashModel {
  @HiveField(1)
  String? data;
  @HiveField(2)
  bool? isRegistered;

  IntroSplashModel({required this.data,required this.isRegistered});
}



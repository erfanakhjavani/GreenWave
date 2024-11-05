import 'package:hive/hive.dart';

@HiveType(typeId: 2)
class RegisterSignupModel {
  @HiveField(1)
  String name;
  @HiveField(2)
  String email;
  @HiveField(3)
  String password;
  @HiveField(4)
  bool isSignUpAccount;

  RegisterSignupModel({required this.name,required this.email, required this.password,required this.isSignUpAccount});
}

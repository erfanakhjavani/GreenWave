import 'package:hive/hive.dart';

@HiveType(typeId: 1)
class RegisterLoginModel {
  @HiveField(1)
  String email;
  @HiveField(2)
  String password;
  @HiveField(3)
  bool isLoginAccount;

  RegisterLoginModel({required this.email, required this.password,required this.isLoginAccount});
}

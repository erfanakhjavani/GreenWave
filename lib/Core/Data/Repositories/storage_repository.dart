import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class DataRepository {
  final storage =  const FlutterSecureStorage();

  void saveData(String key, dynamic value) async{
   await storage.write(key: key, value: value.toString());
  }

  dynamic loadData(String key) async{
    dynamic data;
    data = await storage.read(key: key);
    return data;
  }

  void deleteData(String key) async{
    await storage.delete(key: key);
  }
}

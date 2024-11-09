import 'package:get_storage/get_storage.dart';

class DataRepository {
  final box = GetStorage();

  void saveData(String key, dynamic value) {
    box.write(key, value);
  }

  dynamic loadData(String key) {
    dynamic data;
    data = box.read(key);
    return data;
  }

  void deleteData(String key) {
    box.remove(key);
  }
}

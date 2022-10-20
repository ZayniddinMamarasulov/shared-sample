import 'package:shared_preferences/shared_preferences.dart';

class StorageRepository {
  static StorageRepository? _storage;
  static SharedPreferences? _sharedPreferences;

  static Future<StorageRepository> getInstance() async {
    if (_storage == null) {
      var newStorage = StorageRepository._();
      await newStorage._init();
      _storage = newStorage;
      print("NEW INSTANCE");
    }
    return _storage!;
  }

  StorageRepository._();

  Future _init() async {
    _sharedPreferences = await SharedPreferences.getInstance();
  }

  static Future<bool>? saveInt(String key, int value) {
    if (_sharedPreferences == null) return null;
    return _sharedPreferences!.setInt(key, value);
  }

  static int getInt(String key) {
    if (_sharedPreferences == null) return 0;
    return _sharedPreferences!.getInt(key) ?? 0;
  }




}

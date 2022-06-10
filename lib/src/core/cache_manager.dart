import 'package:dttv/src/commons/storage_manager.dart';

mixin CacheManager {
  Future<bool> saveToken(String? token) async {
    StorageManager.saveData(CacheManagerKey.TOKEN.toString(), token);
    return true;
  }

  Future<String?>  getToken() async {
    return await StorageManager.readData(CacheManagerKey.TOKEN.toString());
  }

  Future<void> removeToken() async {
    await StorageManager.deleteData(CacheManagerKey.TOKEN.toString());
  }
}

// ignore: constant_identifier_names
enum CacheManagerKey {TOKEN}
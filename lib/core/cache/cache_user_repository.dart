

import 'package:to_do/features/auth/data/user_model.dart';
import 'package:to_do/core/cache/cache_consumer.dart';

class CacheUserRepository {
  final CacheConsumer cache;

  CacheUserRepository(this.cache);

  Future<void> saveUser(UserModel user) async {
    await cache.saveData(key: "user", value: user.toJsonString());
    await cache.saveData(key: "isLoggedIn", value: true);
  }

  UserModel? getUser() {
    final userString = cache.getData(key: "user");
    if (userString == null) return null;
    return UserModel.fromJsonString(userString);
  }


  bool isLoggedIn() {
    return cache.getData(key: "isLoggedIn") ?? false;
  }

  Future<void> setLoggedIn(bool value) async {
    await cache.saveData(key: "isLoggedIn", value: value);
  }

  Future<void> removeUser() async {
    await cache.removeData(key: "user");
    await cache.removeData(key: "isLoggedIn");
  }
  
  Future<void> clearUser() async {
    await cache.clearData();
  }
}

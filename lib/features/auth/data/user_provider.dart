import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:to_do/core/cache/cache_consumer_impl.dart';
import 'package:to_do/core/cache/cache_user_repository.dart';
import 'package:to_do/features/auth/data/user_model.dart';


class UserProvider extends ChangeNotifier {
  UserModel? _user;
  CacheUserRepository? _repo;

  UserModel? get user => _user;
  
  Future<void> init() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    CacheConsumerImpl cache = CacheConsumerImpl(sharedPreferences: prefs);
    _repo = CacheUserRepository(cache);
    _user = _repo!.getUser();
    notifyListeners();
  }
  
  Future<void> updateUser(UserModel newUser) async {
    await _repo!.saveUser(newUser);
    _user = newUser;
    notifyListeners();
  }
  
  String getGreeting() {
    final hour = DateTime.now().hour;
    
    if (hour < 12) {
      return "Good Morning";
    } else if (hour < 17) {
      return "Good Afternoon";
    } else {
      return "Good Evening";
    }
  }
}
import 'dart:convert';
import 'dart:ffi';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:shop_app/models/user.dart';

class StoreAuth {
  final Future<SharedPreferences> _sharedPreferences =
      SharedPreferences.getInstance();

  Future<String?> getToken() async {
    final SharedPreferences sharedPreferences = await _sharedPreferences;
    return sharedPreferences.getString('token');
  }

  Future<String?> getUserId() async {
    final SharedPreferences sharedPreferences = await _sharedPreferences;
    return sharedPreferences.getString('userId');
  }

  Future<User?> getUser() async {
    final SharedPreferences sharedPreferences = await _sharedPreferences;
    return jsonDecode(sharedPreferences.getString('user')!);
  }

  Future<void> saveUserId(User user) async {
    final SharedPreferences sharedPreferences = await _sharedPreferences;
    sharedPreferences.setString('userId', user.id.toString());
  }

  Future<void> saveToken(String token) async {
    final SharedPreferences sharedPreferences = await _sharedPreferences;
    sharedPreferences.setString('token', token);
  }

  Future<void> saveUser(User user) async {
    saveUserId(user);
    final SharedPreferences sharedPreferences = await _sharedPreferences;
    sharedPreferences.setString('user', jsonEncode(user));
  }

  Future<void> restoreUser() async {
    final SharedPreferences sharedPreferences = await _sharedPreferences;
    sharedPreferences.remove('token');
    sharedPreferences.remove('user');
    sharedPreferences.remove('userId');
  }

  Future<bool> logout() async {
    restoreUser();
    return true;
  }
}

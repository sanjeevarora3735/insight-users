import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

class SessionManager {
  SharedPreferences? prefs;

  ///init
  Future<void> init() async {
    prefs = await SharedPreferences.getInstance();
  }

  ///checkers
  Future<bool?> isLoggedIn() async {

    /*For Debugging purpose, returning the true [always] */
    return true;

    return prefs?.getString('token') != null && prefs?.getString('token') != "";
  }

  ///clear session
  Future<bool?> logout() async {
    await prefs?.remove('token');
    SharedPreferences prefsTemp = await SharedPreferences.getInstance();
    return await prefsTemp.clear();
  }

  ///Bearer Token
  //Setter
  Future<void> setToken(String token) async {
    await prefs?.setString('token', token);
  }

  //Getter
  String? getToken() {
    return prefs?.getString('token');
  }
}

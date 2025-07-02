import 'dart:convert';

import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:ostad_ecommers_app/common/model/user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthController extends GetxController {
  final String _userDataKye = 'userData_kye';
  final String _token = 'access-token';
  UserModel? userModel;
  String? accessToken;

  Future<void> saveData(UserModel model, String token) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    await sharedPreferences.setString(_userDataKye, jsonEncode(model.toJson()));
    await sharedPreferences.setString(_token, token);
    userModel = model;
    accessToken = token;
  }

  Future<void> getUserData() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    String? userData = sharedPreferences.getString(_userDataKye);
    String? tokenData = sharedPreferences.getString(_token);
    if (userData != null) {
      userModel = UserModel.fromJson(jsonDecode(userData));
    }
    accessToken = tokenData;
  }

  Future<bool> isUserLoggedIn() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    String? tokenData = sharedPreferences.getString(_token);
    if (tokenData != null && tokenData.isNotEmpty) {
      getUserData();
      return true;
    }
    return false;
  }

  Future<void> clearUserData() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    await sharedPreferences.clear();
    userModel = null;
    accessToken = null;
  }
}

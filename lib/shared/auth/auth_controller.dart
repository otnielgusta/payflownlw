import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:payflownlw/shared/models/user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthController {
  UserModel? _user;

  get user => _user;

  void setUser(UserModel? user, BuildContext context) {
    if (user != null) {
      saveUser(user);
      _user = user;

      Navigator.pushReplacementNamed(context, "/home", arguments: user);
    } else {
      Navigator.pushReplacementNamed(context, "/login");
    }
  }

  Future<void> saveUser(UserModel user) async {
    final instance = await SharedPreferences.getInstance();
    await instance.setString("user", user.toJson());
    return;
  }

  Future<void> currentUser(BuildContext context) async {
    final instance = await SharedPreferences.getInstance();
    await Future.delayed(Duration(seconds: 3));
    if (instance.containsKey("user")) {
      final user = instance.get("user") as String;
      setUser(UserModel.fromJson(user), context);
      return;
    } else {
      setUser(null, context);
    }
  }
}

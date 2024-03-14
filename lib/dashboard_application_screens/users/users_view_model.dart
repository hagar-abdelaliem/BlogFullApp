import 'package:flutter/material.dart';
import 'package:untitled2/dashboard_application_screens/users/users_navigator.dart';
import 'package:untitled2/models/user_response_model.dart';
import 'package:untitled2/shared/base.dart';
import 'package:untitled2/shared/network/remote/api_manager.dart';

class UsersViewModel extends BaseViewModel<UserNavigator> {
  addNewUser(UserResponse user) async {
    navigator!.showLoading();
    var response = await ApiManager.registerUser(user);
    if (response.message == "User created successfully") {
      navigator!.hideLoading();
      navigator!.showMessage(response.message!, true);
    } else {
      navigator!.hideLoading();
      navigator!.showMessage(response.message!, false);
    }
  }

  Future<void> updateUserInfo(UserResponse? user, BuildContext context) async {}

  Future<void> deleteUserById(String? id, BuildContext context) async {}

  String? userNameValidation(text) {
    if (text == null || text.trim().isEmpty) {
      return 'Please enter user userName';
    }
    return null;
  }

  String? emailValidation(text) {
    final bool emailValid = RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(text!);
    if (text == null || text.trim().isEmpty) {
      return 'Please enter user email';
    } else if (!emailValid) {
      return 'Please enter a valid Email Address';
    }
    return null;
  }

  String? passwordValidation(text) {
    if (text == null || text.trim().isEmpty) {
      return 'Please enter user Password';
    } else if (text.length < 6) {
      return 'Password must be at least 9 characters';
    }
    return null;
  }
}

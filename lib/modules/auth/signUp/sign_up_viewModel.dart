import 'dart:async';

import 'package:untitled2/models/user_response_model.dart';
import 'package:untitled2/modules/auth/signUp/signup_navigator.dart';
import 'package:untitled2/shared/base.dart';
import 'package:untitled2/shared/network/remote/api_manager.dart';

class SignUpViewModel extends BaseViewModel<SignupNavigator> {
  addNewUser(UserResponse user) async {
    navigator!.showLoading();
    var response = await ApiManager.registerUser(user);
    if (response.message == "User created successfully") {
      navigator!.hideLoading();
      navigator!.showMessage(response.message!, true);
      Timer(const Duration(seconds: 1), () {
        navigator!.goToLogin();
      });
    } else {
      navigator!.hideLoading();
      navigator!.showMessage(response.message!, false);
    }
  }

  String? emailValidation(text) {
    final bool emailValid = RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(text!);
    if (text == null || text.trim().isEmpty) {
      notifyListeners();
      return 'Please enter your email';
    } else if (!emailValid) {
      notifyListeners();
      return 'Please enter a valid Email Address';
    }
    return null;
  }

  String? passwordValidation(text) {
    if (text == null || text.trim().isEmpty) {
      return 'Please enter your Password';
    } else if (text.length < 6) {
      return 'Password must be at least 5 characters';
    }
    return null;
  }

  String? usernameValidation(text) {
    if (text == null || text.trim().isEmpty) {
      return 'Please enter your username';
    }
    return null;
  }
}

import 'package:untitled2/models/user_response_model.dart';
import 'package:untitled2/modules/auth/logIn/login_navigator.dart';
import 'package:untitled2/shared/base.dart';
import 'package:untitled2/shared/network/remote/api_manager.dart';

class LoginViewModel extends BaseViewModel<LoginNavigator> {
  login(UserResponse user) async {
    navigator!.showLoading();
    var responseData = await ApiManager.loginUser(user);
    if (responseData.token != null) {
      navigator!.hideLoading();
      if (responseData.user!.role == 'admin') {
        navigator!.goToAdminPanel();
      } else {
        navigator!.goToHome();
      }
    } else {
      navigator!.hideLoading();
      navigator!.showMessage(responseData.message!, false);
    }
  }

  String? usernameValidation(text) {
    if (text == null || text.trim().isEmpty) {
      return 'Please enter your username';
    }
    return null;
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
}

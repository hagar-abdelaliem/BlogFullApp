import 'package:untitled2/models/user_response_model.dart';

class LoginResponse {
  UserResponse? user;
  String? token;
  String? message;

  LoginResponse({this.user, this.token, this.message});

  LoginResponse.fromJson(Map<String, dynamic> json) {
    user = json['user'] != null ? UserResponse.fromJson(json['user']) : null;
    token = json['token'];
    message = json['message'];
  }
}

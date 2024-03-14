import 'package:flutter/material.dart';
import 'package:untitled2/dashboard_application_screens/dashboard_controller/main_dashboard_controller.dart';
import 'package:untitled2/modules/auth/logIn/login_view.dart';
import 'package:untitled2/modules/auth/signUp/sign_up_view.dart';
import 'package:untitled2/modules/home/home_screen.dart';
import 'package:untitled2/modules/news/news_content.dart';
import 'package:untitled2/shared/style/my_theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        HomeScreen.routeName: (context) => HomeScreen(),
        NewsContent.routeName: (context) => NewsContent(),
        SignupView.routeName: (context) => SignupView(),
        LoginView.routeName: (context) => LoginView(),
        DashBoardScreenController.routeName: (context) =>
            DashBoardScreenController(),
      },
      initialRoute: LoginView.routeName,
      theme: MyThemeData.lightTheme,
    );
  }
}

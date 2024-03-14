import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:untitled2/dashboard_application_screens/dashboard_controller/main_dashboard_controller.dart';
import 'package:untitled2/models/user_response_model.dart';
import 'package:untitled2/modules/auth/logIn/login_navigator.dart';
import 'package:untitled2/modules/auth/logIn/login_viewModel.dart';
import 'package:untitled2/modules/auth/signUp/sign_up_view.dart';
import 'package:untitled2/modules/home/home_screen.dart';
import 'package:untitled2/shared/base.dart';
import 'package:untitled2/shared/componentes/customWidets/customButton.dart';
import 'package:untitled2/shared/componentes/customWidets/customTextField.dart';
import 'package:untitled2/shared/style/my_theme.dart';

class LoginView extends StatefulWidget {
  static const String routeName = "LoginView";

  LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends BaseState<LoginView, LoginViewModel>
    implements LoginNavigator {
  var emailController = TextEditingController();

  var passwordController = TextEditingController();

  var usernameController = TextEditingController();

  var keyForm = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (c) => viewModel,
      child: Scaffold(
        backgroundColor: MyThemeData.primaryColor,
        body: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 40),
            height: MediaQuery.of(context).size.height - 50,
            width: double.infinity,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Column(
                  children: <Widget>[
                    const SizedBox(height: 60.0),
                    const Text(
                      "Welcome Back",
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Text(
                      "Enter your credential to login",
                      style: TextStyle(fontSize: 15, color: Colors.grey[700]),
                    )
                  ],
                ),
                Form(
                  key: keyForm,
                  child: Column(
                    children: <Widget>[
                      CustomTextField(
                        text: "Email",
                        icon: const Icon(Icons.email),
                        controller: emailController,
                        validatorFunction: (text) =>
                            viewModel!.emailValidation(text),
                      ),
                      const SizedBox(height: 20),
                      CustomTextField(
                        text: "Password",
                        icon: const Icon(Icons.password),
                        controller: passwordController,
                        validatorFunction: (text) =>
                            viewModel!.passwordValidation(text),
                      ),
                    ],
                  ),
                ),
                CustomButton(
                  text: "Login",
                  function: loginButtonFunction,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    const Text("Don't have an account? "),
                    TextButton(
                        onPressed: () {
                          Navigator.pushNamed(context, SignupView.routeName);
                        },
                        child: const Text(
                          "Sign Up",
                          style: TextStyle(color: Colors.white),
                        ))
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  loginButtonFunction() async {
    if (keyForm.currentState!.validate() == true) {
      UserResponse user = UserResponse(
          email: emailController.text, password: passwordController.text);
      // please login
      viewModel.login(user);
    }
  }

  @override
  void goToHome() {
    Navigator.pushNamed(context, HomeScreen.routeName);
  }

  @override
  LoginViewModel initViewModel() {
    return LoginViewModel();
  }

  @override
  void goToAdminPanel() {
    Navigator.pushNamed(context, DashBoardScreenController.routeName);
  }
}

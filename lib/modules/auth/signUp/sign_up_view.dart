import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:untitled2/models/user_response_model.dart';
import 'package:untitled2/modules/auth/logIn/login_view.dart';
import 'package:untitled2/modules/auth/signUp/sign_up_viewModel.dart';
import 'package:untitled2/modules/auth/signUp/signup_navigator.dart';
import 'package:untitled2/shared/base.dart';
import 'package:untitled2/shared/componentes/customWidets/customButton.dart';
import 'package:untitled2/shared/componentes/customWidets/customTextField.dart';
import 'package:untitled2/shared/style/my_theme.dart';

class SignupView extends StatefulWidget {
  static const String routeName = "SignupView";

  SignupView({super.key});

  @override
  State<SignupView> createState() => _SignupViewState();
}

class _SignupViewState extends BaseState<SignupView, SignUpViewModel>
    implements SignupNavigator {
  var emailController = TextEditingController();

  var passwordController = TextEditingController();

  var confirmPasswordController = TextEditingController();

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
                      "Sign up",
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                      "Create your account",
                      style: TextStyle(fontSize: 15, color: Colors.grey[700]),
                    )
                  ],
                ),
                Form(
                  key: keyForm,
                  child: Column(
                    children: <Widget>[
                      CustomTextField(
                        text: "Username",
                        icon: const Icon(Icons.person),
                        controller: usernameController,
                        validatorFunction: (text) =>
                            viewModel.usernameValidation(text),
                      ),
                      const SizedBox(height: 20),
                      CustomTextField(
                        text: "Email",
                        icon: const Icon(Icons.email),
                        controller: emailController,
                        validatorFunction: (text) =>
                            viewModel.emailValidation(text),
                      ),
                      const SizedBox(height: 20),
                      CustomTextField(
                        text: "Password",
                        icon: const Icon(Icons.password),
                        controller: passwordController,
                        validatorFunction: (text) =>
                            viewModel.passwordValidation(text),
                      ),
                      const SizedBox(height: 20),
                      CustomTextField(
                        text: "Confirm Password",
                        icon: const Icon(Icons.password),
                        controller: confirmPasswordController,
                        validatorFunction: (text) =>
                            viewModel.passwordValidation(text),
                      ),
                    ],
                  ),
                ),
                CustomButton(
                  text: "Sign Up",
                  function: signUpButtonFunction,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    const Text("Already have an account?"),
                    TextButton(
                        onPressed: () {
                          Navigator.pushNamed(context, LoginView.routeName);
                        },
                        child: const Text(
                          "Login",
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

  signUpButtonFunction() async {
    if (keyForm.currentState!.validate() == true) {
      UserResponse user = UserResponse(
        name: usernameController.text,
        email: emailController.text,
        password: passwordController.text,
        role: "user",
      );
      // please login
      viewModel.addNewUser(user);
    }
  }

  @override
  SignUpViewModel initViewModel() {
    return SignUpViewModel();
  }

  @override
  void goToLogin() {
    Navigator.pushNamed(context, LoginView.routeName);
  }
}

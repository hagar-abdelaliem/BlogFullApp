import 'package:flutter/material.dart';
import 'package:untitled2/dashboard_application_screens/users/users_view_model.dart';
import 'package:untitled2/models/user_response_model.dart';
import 'package:untitled2/shared/componentes/customWidets/simple_text_field.dart';

class CustomAlertDialog extends StatefulWidget {
  String title;
  GlobalKey<FormState> formKey;
  String actionText;
  final Function()? actionFunction;
  UsersViewModel? viewModel;
  TextEditingController nameController;
  TextEditingController emailController;
  TextEditingController? passwordController;
  String? role;

  CustomAlertDialog({
    super.key,
    required this.title,
    required this.formKey,
    required this.actionText,
    this.actionFunction,
    required this.viewModel,
    required this.nameController,
    required this.emailController,
    this.passwordController,
  });

  @override
  State<CustomAlertDialog> createState() => _CustomAlertDialogState();
}

class _CustomAlertDialogState extends State<CustomAlertDialog> {
  List<String> roleList = ['user', 'admin'];
  String dropDawnValueType = 'user';

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      scrollable: true,
      title: Text(
        widget.title,
        style: Theme.of(context).textTheme.headline2!.copyWith(fontSize: 16),
      ),
      content: SingleChildScrollView(
        child: Form(
          key: widget.formKey,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const SizedBox(
                height: 10,
              ),
              SimpleTextField(
                text: 'User Name',
                controller: widget.nameController,
                validatorFunction: (text) =>
                    widget.viewModel?.userNameValidation(text),
              ),
              const SizedBox(
                height: 10,
              ),
              SimpleTextField(
                text: 'User Email',
                controller: widget.emailController,
                validatorFunction: (text) =>
                    widget.viewModel?.emailValidation(text),
              ),
              const SizedBox(
                height: 10,
              ),
              if (widget.actionText != 'Update')
                SimpleTextField(
                  text: 'User Password',
                  controller: widget.passwordController!,
                  validatorFunction: (text) =>
                      widget.viewModel?.passwordValidation(text),
                ),
              const SizedBox(
                height: 10,
              ),
              const SizedBox(
                height: 10,
              ),
              const SizedBox(
                height: 10,
              ),
              ListTile(
                title: const Text('Select Type'),
                trailing: DropdownButton(
                  items: roleList
                      .map((String value) => DropdownMenuItem(
                            value: value,
                            child: Text(value),
                          ))
                      .toList(),
                  value: widget.actionText == 'Update'
                      ? widget.role
                      : dropDawnValueType,
                  onChanged: (String? val) {
                    setState(() {
                      widget.actionText == 'Update'
                          ? widget.role = val!
                          : dropDawnValueType = val!;
                      print(dropDawnValueType);
                    });
                  },
                  style: const TextStyle(color: Colors.black, fontSize: 12),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
            ],
          ),
        ),
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.only(
              left: 2.0, right: 8.0, bottom: 8.0, top: 8.0),
          child: TextButton(
            onPressed: () {
              clearControllers();
              Navigator.pop(context);
            },
            child: const Text(
              'Cancel',
              style: TextStyle(color: Colors.green, fontSize: 15),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 8.0, bottom: 8.0, top: 8.0),
          child: TextButton(
            onPressed: widget.actionText == 'Add'
                ? addNewUser
                : (widget.actionText == 'Update'
                    ? updateUser
                    : widget.actionFunction),
            child: Text(
              widget.actionText,
              style: const TextStyle(fontSize: 18, color: Colors.green),
            ),
          ),
        )
      ],
    );
  }

  void addNewUser() {
    if (widget.formKey.currentState!.validate()) {
      UserResponse user = UserResponse(
        name: widget.nameController.text,
        email: widget.emailController.text,
        password: widget.passwordController!.text,
        role: dropDawnValueType,
      );
      widget.viewModel!.addNewUser(user);
      clearControllers();
    }
  }

  void updateUser() {
    if (widget.formKey.currentState!.validate()) {
      UserResponse user = UserResponse(
        name: widget.nameController.text,
        email: widget.emailController.text,
        role: widget.role,
      );
      widget.viewModel!.updateUserInfo(user, context);
      clearControllers();
    }
  }

  clearControllers() {
    widget.nameController.clear();
    widget.emailController.clear();
    if (widget.actionText != 'Update') {
      widget.passwordController!.clear();
    }
  }
}

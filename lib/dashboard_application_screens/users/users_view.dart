import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:untitled2/dashboard_application_screens/users/users_navigator.dart';
import 'package:untitled2/dashboard_application_screens/users/users_view_model.dart';
import 'package:untitled2/models/user_response_model.dart';
import 'package:untitled2/shared/base.dart';

import 'modules/custom_alert_dialog.dart';

class UsersView extends StatefulWidget {
  const UsersView({Key? key}) : super(key: key);
  static const String routeName = "userView";

  @override
  State<UsersView> createState() => _UsersViewState();
}

class _UsersViewState extends BaseState<UsersView, UsersViewModel>
    implements UserNavigator {
  List<UserResponse>? _users;
  List<UserResponse> _filteredUsers = [];
  String _searchQuery = ''; //
  Widget _buildSearchBar() {
    return Expanded(
      child: Padding(
        padding: EdgeInsets.only(
          left: MediaQuery.of(context).size.width * 0.12,
          right: MediaQuery.of(context).size.width * 0.13,
          bottom: MediaQuery.of(context).size.height * .02,
        ),
        child: TextField(
          onChanged: (query) {
            setState(() {
              _searchQuery = query;
              _filteredUsers = _users!
                  .where((user) =>
                      user.name!
                          .toLowerCase()
                          .contains(_searchQuery.toLowerCase()) ||
                      user.id
                          .toString()
                          .toLowerCase()
                          .contains(_searchQuery.toLowerCase()))
                  .toList();
            });
          },
          decoration: InputDecoration(
            filled: true,
            fillColor: Colors.white,
            hintText: 'Search by name or ssn or ID',
            prefixIcon: const Icon(Icons.search),
            enabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(
                width: 3,
                color: Colors.grey,
              ),
              borderRadius: BorderRadius.circular(25),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(
                width: 3,
                color: Colors.grey,
              ),
              borderRadius: BorderRadius.circular(25),
            ),
          ),
        ),
      ),
    );
  }

  late TextEditingController deleteUserController;
  late TextEditingController idController;
  late TextEditingController nameController;
  late TextEditingController emailController;
  late TextEditingController passwordController;
  late TextEditingController phoneController;
  late String role;

  final GlobalKey<FormState> addNewUserFormKey = GlobalKey<FormState>();
  final GlobalKey<FormState> deleteUserFormKey = GlobalKey<FormState>();

  @override
  void initState() {
    deleteUserController = TextEditingController();
    nameController = TextEditingController();
    emailController = TextEditingController();
    passwordController = TextEditingController();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => viewModel,
      child: Scaffold(
        body: Center(
          child: Column(
            children: [
              Container(
                alignment: Alignment.topRight,
                margin: const EdgeInsets.only(top: 15, right: 15),
                padding: const EdgeInsets.all(10),
                child: Row(
                  children: [
                    _buildSearchBar(),
                    TextButton(
                      onPressed: openAddNewUserDialog,
                      child: const Text(
                        'add new user +',
                        style: TextStyle(fontSize: 17),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Container(
                    margin: const EdgeInsets.only(left: 15, right: 15),
                    decoration: const BoxDecoration(
                      color: Colors.white,
                    ),
                    child: const SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Center(
                        child: Text(
                          'All users',
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  UsersViewModel initViewModel() {
    return UsersViewModel();
  }

  @override
  Future openAddNewUserDialog() => showDialog(
        context: context,
        builder: (context) => CustomAlertDialog(
          title: 'Add New User',
          formKey: addNewUserFormKey,
          actionText: 'Add',
          viewModel: viewModel,
          nameController: nameController,
          emailController: emailController,
          passwordController: passwordController,
        ),
      );

  TextStyle textStyle = const TextStyle(
      fontWeight: FontWeight.bold, fontSize: 15, color: Colors.green);
  TextStyle subtitleStyle = const TextStyle(
    color: Colors.green,
  );

  Future viewUser(UserResponse user) => showDialog(
        context: context,
        builder: (context) => AlertDialog(
          scrollable: true,
          title: Center(
            child: Text(
              user.name!.toUpperCase(),
              style: Theme.of(context).textTheme.headline6!,
            ),
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                title: Text(
                  'ID:',
                  style: textStyle,
                ),
                leading: const Icon(Icons.assignment_ind, color: Colors.green),
                subtitle: Text(
                  "ID",
                  style: subtitleStyle,
                ),
              ),
              ListTile(
                title: Text(
                  'Name:',
                  style: textStyle,
                ),
                leading: const Icon(Icons.person, color: Colors.green),
                subtitle: Text(
                  "name",
                  style: subtitleStyle,
                ),
              ),
              ListTile(
                title: Text(
                  'Email:',
                  style: textStyle,
                ),
                leading: const Icon(Icons.email, color: Colors.green),
                subtitle: Text(
                  "email",
                  style: subtitleStyle,
                ),
              ),
              ListTile(
                title: Text(
                  'Role:',
                  style: textStyle,
                ),
                leading: const Icon(Icons.groups, color: Colors.green),
                subtitle: Text(
                  "role",
                  style: subtitleStyle,
                ),
              ),
              ListTile(
                title: Text(
                  'Account Created Date:',
                  style: textStyle,
                ),
                leading: const Icon(Icons.date_range, color: Colors.green),
                subtitle: Text(
                  "createdAt",
                  style: subtitleStyle,
                ),
              ),
            ],
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.only(
                  left: 2.0, right: 8.0, bottom: 8.0, top: 8.0),
              child: OutlinedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text(
                  'Cancel',
                  style: TextStyle(
                    color: Colors.green,
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      );

  String? formattedDate(String date) {
    DateTime dateTime = DateTime.parse(date);
    return '${dateTime.year}-${dateTime.month}-${dateTime.day} at ${dateTime.hour}:${dateTime.minute}';
  }

  clearAllControllers() {
    //
    idController.clear();
    nameController.clear();
    emailController.clear();
    passwordController.clear();
    phoneController.clear();
  }
}

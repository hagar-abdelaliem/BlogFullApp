import 'package:flutter/material.dart';
import 'package:untitled2/modules/auth/logIn/login_view.dart';

class DesktopSettingsView extends StatefulWidget {
  static const String routeName = 'settingsView';

  const DesktopSettingsView({super.key});

  @override
  State<DesktopSettingsView> createState() => _SettingsViewState();
}

class _SettingsViewState extends State<DesktopSettingsView> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: ListView(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.02,
          ),
          ListTile(
            title: const Text(
              'Logout',
              style: TextStyle(fontSize: 21, color: Colors.black),
            ),
            leading: const Icon(
              Icons.logout,
              size: 21,
            ),
            onTap: () async {
              await showDialog(
                context: context,
                builder: (context) => AlertDialog(
                  title: const Text(
                    'Logout',
                    style: TextStyle(fontSize: 21),
                  ),
                  content: const Text('Are you sure you want to logout?',
                      style: TextStyle(fontSize: 17)),
                  actions: [
                    TextButton(
                      child: const Text('Cancel',
                          style: TextStyle(fontSize: 15, color: Colors.green)),
                      onPressed: () => Navigator.of(context).pop(false),
                    ),
                    TextButton(
                        child: const Text('Logout',
                            style: TextStyle(fontSize: 15, color: Colors.red)),
                        onPressed: () async {
                          //sign out
                          Navigator.pushReplacementNamed(
                              context, LoginView.routeName);
                        }),
                  ],
                ),
              );
            },
          ),
          const Divider(),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.68,
          ),
        ],
      )),
    );
  }
}

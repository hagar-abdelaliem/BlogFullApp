import 'package:flutter/material.dart';
import 'package:untitled2/dashboard_application_screens/users/users_view.dart';
import 'package:untitled2/shared/style/my_theme.dart';

class MobileDrawerMenu extends StatefulWidget {
  static const String routeName = 'MobileDrawerMenu';

  MobileDrawerMenu({super.key});

  @override
  State<MobileDrawerMenu> createState() => _MobileDrawerMenuState();
}

class _MobileDrawerMenuState extends State<MobileDrawerMenu> {
  var currentPage = DrawerSections.categories;

  @override
  Widget build(BuildContext context) {
    var container;
    if (currentPage == DrawerSections.users) {
      container = UsersView();
    } else if (currentPage == DrawerSections.calendar) {
      //container =  CalendarView();
    } else if (currentPage == DrawerSections.settings) {
      // container = SettingsView();
    }
    return Scaffold(
      appBar: AppBar(
        title: const Text("Admin Panel"),
        backgroundColor: MyThemeData.primaryColor,
        iconTheme: const IconThemeData(
          color: Colors.black, // change the color here
        ),
        actions: [
          Center(
              child: Text(
            'user',
            style: Theme.of(context)
                .textTheme
                .titleSmall!
                .copyWith(color: Colors.white),
          )),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.person),
            color: Colors.white,
          ),
        ],
      ),
      drawer: Drawer(
        child: MyDrawerList(),
      ),
      body: container,
    );
  }

  Widget MyDrawerList() {
    return Container(
      padding: const EdgeInsets.only(
        top: 15,
      ),
      child: ListView(
        // shows the list of menu drawer
        children: [
          SizedBox(height: MediaQuery.of(context).size.height * 0.02),
          menuItem(1, "Categories", Icons.dashboard,
              currentPage == DrawerSections.categories ? true : false),
          menuItem(2, "Users", Icons.badge_outlined,
              currentPage == DrawerSections.users ? true : false),
          menuItem(2, "Admin Reports", Icons.badge_outlined,
              currentPage == DrawerSections.reports ? true : false),
          menuItem(5, "Calender", Icons.calendar_month_rounded,
              currentPage == DrawerSections.calendar ? true : false),
          menuItem(6, "Settings", Icons.settings,
              currentPage == DrawerSections.settings ? true : false),
        ],
      ),
    );
  }

  Widget menuItem(int id, String title, IconData icon, bool selected) {
    return Material(
      color: selected ? Colors.green.withOpacity(0.2) : Colors.transparent,
      child: InkWell(
        onTap: () {
          Navigator.pop(context);
          setState(() {
            if (id == 1) {
              currentPage = DrawerSections.categories;
            } else if (id == 2) {
              currentPage = DrawerSections.users;
            } else if (id == 3) {
              currentPage = DrawerSections.reports;
            } else if (id == 4) {
              currentPage = DrawerSections.calendar;
            } else if (id == 4) {
              currentPage = DrawerSections.settings;
            }
          });
        },
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Row(
            children: [
              Expanded(
                child: Icon(
                  icon,
                  size: 20,
                  color: Colors.black,
                ),
              ),
              Expanded(
                flex: 3,
                child: Text(
                  title,
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

enum DrawerSections {
  categories,
  users,
  reports,
  calendar,
  settings,
}

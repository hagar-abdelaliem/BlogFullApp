import 'package:flutter/material.dart';
import 'package:untitled2/dashboard_application_screens/calendar/calendar_view.dart';
import 'package:untitled2/dashboard_application_screens/categoriesManegar/viewAllCategories/caregories_view.dart';
import 'package:untitled2/dashboard_application_screens/reports/reports_view.dart';
import 'package:untitled2/dashboard_application_screens/settings/desktop_settings.dart';
import 'package:untitled2/dashboard_application_screens/users/users_view.dart';
import 'package:untitled2/shared/componentes/customWidets/drawer_list_tile.dart';
import 'package:untitled2/shared/style/my_theme.dart';
import 'package:vertical_tabs_flutter/vertical_tabs.dart';

class DesktopDrawerMenu extends StatelessWidget {
  static const String routeName = 'DesktopDrawerMenu';

  const DesktopDrawerMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: MyThemeData.primaryColor,
        title: const Text("Admin panel"),
        actions: [
          Center(
              child: Text(
            'Admin',
            style: Theme.of(context).textTheme.headline5,
          )),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.person),
            color: Colors.grey,
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: VerticalTabs(
              indicatorWidth: 7,
              indicatorSide: IndicatorSide.start,
              tabsWidth: 220,
              indicatorColor: Colors.green.withOpacity(0.7),
              selectedTabBackgroundColor: Colors.green.withOpacity(0.1),
              tabs: const [
                Tab(
                  child: Padding(
                    padding: EdgeInsets.only(left: 10.0),
                    child: DrawerListTile(
                      title: 'Categories',
                      icon: Icon(Icons.category, size: 20, color: Colors.black),
                    ),
                  ),
                ),
                Tab(
                  child: Padding(
                    padding: EdgeInsets.only(left: 10.0),
                    child: DrawerListTile(
                      title: 'Users',
                      icon: Icon(Icons.badge_outlined,
                          size: 20, color: Colors.black),
                    ),
                  ),
                ),
                Tab(
                  child: Padding(
                    padding: EdgeInsets.only(left: 10.0),
                    child: DrawerListTile(
                      title: 'Admin Reports',
                      icon: Icon(Icons.insert_chart,
                          size: 20, color: Colors.black),
                    ),
                  ),
                ),
                Tab(
                  child: Padding(
                    padding: EdgeInsets.only(left: 10.0),
                    child: DrawerListTile(
                      title: 'Calendar',
                      icon: Icon(Icons.calendar_month_rounded,
                          size: 20, color: Colors.black),
                    ),
                  ),
                ),
                Tab(
                  child: Padding(
                    padding: EdgeInsets.only(left: 10.0),
                    child: DrawerListTile(
                      title: 'Settings',
                      icon: Icon(Icons.settings, size: 20, color: Colors.black),
                    ),
                  ),
                ),
              ],
              contents: const [
                CategoriesView(),
                UsersView(),
                ReportsView(),
                CalendarDashboardView(),
                DesktopSettingsView(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

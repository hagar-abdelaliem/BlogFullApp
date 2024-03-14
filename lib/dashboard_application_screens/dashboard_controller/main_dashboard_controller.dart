import 'package:flutter/material.dart';
import 'package:untitled2/shared/componentes/desktop_drawer_menu.dart';
import 'package:untitled2/shared/componentes/smallScreen_drawer_menu.dart';
import 'package:untitled2/utils/responsive.dart';

class DashBoardScreenController extends StatelessWidget {
  static const String routeName = 'DashBoardScreen';

  const DashBoardScreenController({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ResponsiveWidget.isDestop(context)
                ? const Expanded(child: DesktopDrawerMenu())
                : Expanded(child: MobileDrawerMenu()),
          ],
        ),
      ),
    );
  }
}

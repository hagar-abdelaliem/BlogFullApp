import 'package:flutter/material.dart';
import 'package:untitled2/models/CategoryModel.dart';
import 'package:untitled2/modules/auth/logIn/login_view.dart';
import 'package:untitled2/modules/home/categories_fragment.dart';
import 'package:untitled2/modules/home/drawer.dart';
import 'package:untitled2/modules/home/news_fragment.dart';

class HomeScreen extends StatefulWidget {
  static const routeName = "HomeScreen";

  HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Category? selectedCategory;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: HomeDrawer(onMenuItemClicked),
      appBar: AppBar(
        title: Text(
            selectedCategory == null ? "Blog App" : selectedCategory!.name!),
        centerTitle: true,
      ),
      body: selectedCategory == null
          ? CategoriesFragments(onCategoryClicked)
          : NewsFragments(selectedCategory!),
    );
  }

  void onCategoryClicked(Category category) {
    // change ui body
    setState(() {
      selectedCategory = category;
    });
  }

  void onMenuItemClicked(int itemClicked) {
    Navigator.pop(context);

    if (itemClicked == HomeDrawer.CATEGORY) {
      setState(() {
        selectedCategory = null;
      });
    } else if (itemClicked == HomeDrawer.LOGOUT) {
      Navigator.pushNamed(context, LoginView.routeName);
    }
  }
}

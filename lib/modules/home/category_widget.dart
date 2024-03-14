import 'package:flutter/material.dart';
import 'package:untitled2/models/CategoryModel.dart';
import 'package:untitled2/shared/style/my_theme.dart';

class CategoryWidget extends StatelessWidget {
  Category category;
  int index;

  CategoryWidget(this.index, this.category);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(
        top: 20,
        bottom: 10,
      ),
      decoration: BoxDecoration(
        color: getColorFromCode(category.colorCode),
        borderRadius: BorderRadius.only(
          topRight: const Radius.circular(25),
          topLeft: const Radius.circular(25),
          bottomLeft: Radius.circular(index % 2 == 0 ? 25 : 0),
          bottomRight: Radius.circular(index % 2 != 0 ? 25 : 0),
        ),
      ),
      child: Column(
        children: [
          Image.asset(category.image!, height: 100, fit: BoxFit.fill),
          Expanded(
            child: Center(
              child: Text(
                category.name ?? "non",
                style: Theme.of(context).textTheme.headlineMedium,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Color getColorFromCode(String? colorCode) {
    try {
      if (colorCode != null) {
        return Color(int.parse(colorCode, radix: 16) + 0xFF000000);
      }
    } catch (e) {
      // Handle the exception
    }
    // Return a default color in case of error
    return MyThemeData.primaryColor;
  }
}

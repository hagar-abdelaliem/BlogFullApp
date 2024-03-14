import 'package:flutter/material.dart';
import 'package:untitled2/models/CategoryModel.dart';
import 'package:untitled2/modules/home/categoriesView.dart';
import 'package:untitled2/shared/network/remote/api_manager.dart';

class CategoriesFragments extends StatelessWidget {
  Function onCategoryClicked;

  CategoriesFragments(this.onCategoryClicked);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(30),
      child: FutureBuilder<CategoryResponse>(
          future: ApiManager.getCategories(),
          builder: (c, snapShot) {
            if (snapShot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            }
            if (snapShot.hasError) {
              return Column(
                children: [
                  const Center(child: Text('Something went wrong')),
                  ElevatedButton(
                      onPressed: () {}, child: const Text('Try Again')),
                ],
              );
            }

            List<Category>? categoriesList = snapShot.data?.categories;
            return CategoriesView(categoriesList!, onCategoryClicked);
          }),
    );
  }
}

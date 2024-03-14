import 'package:flutter/material.dart';
import 'package:untitled2/models/CategoryModel.dart';
import 'package:untitled2/modules/home/category_widget.dart';

class CategoriesView extends StatelessWidget {
  List<Category> categories;
  Function onCategoryClicked;

  CategoriesView(this.categories, this.onCategoryClicked);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Text(
            'Pick your category \nof interest',
            style: TextStyle(fontSize: 30),
          ),
          const SizedBox(
            height: 25,
          ),
          Expanded(
            child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 30,
                  mainAxisSpacing: 20,
                ),
                itemCount: categories.length,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      onCategoryClicked(categories[index]);
                    },
                    child: CategoryWidget(index, categories[index]),
                  );
                }),
          ),
        ],
      ),
    );
  }
}

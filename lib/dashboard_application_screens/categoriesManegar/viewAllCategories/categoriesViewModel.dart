import 'package:untitled2/dashboard_application_screens/categoriesManegar/viewAllCategories/Categories_navigator.dart';
import 'package:untitled2/models/CategoryModel.dart';
import 'package:untitled2/shared/base.dart';
import 'package:untitled2/shared/network/remote/api_manager.dart';

class CategoriesViewModel extends BaseViewModel<CategoriesNavigator> {
  void addNewCategory(Category category) async {
    navigator!.showLoading();
    var response = await ApiManager.addCategories(category);
    if (response.message == "Category created successfully") {
      navigator!.hideLoading();
      navigator!.showMessage(response.message!, true);
    } else {
      navigator!.hideLoading();
      navigator!.showMessage(response.message!, false);
    }
  }

  void updateCategoryInfo(Category category) {}

  void deleteCategoryById(int? id) async {
    ApiManager.deleteCategory(id!);
  }

  String? categoryNameValidation(text) {
    if (text == null || text.trim().isEmpty) {
      return 'Please enter category name';
    }
    return null;
  }
}

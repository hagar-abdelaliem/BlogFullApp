import 'package:untitled2/models/CategoryModel.dart';
import 'package:untitled2/shared/base.dart';

abstract class CategoriesNavigator extends BaseNavigator {
  Future openAddNewCategoryDialog();

  Future openUpdateCategoryDialog(Category category);

  Future openDeleteCategoryDialog(Category category);
}

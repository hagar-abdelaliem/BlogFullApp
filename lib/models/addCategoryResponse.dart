import 'package:untitled2/models/CategoryModel.dart';

class AddCategoryResponse {
  Category? category;
  String? message;

  AddCategoryResponse({this.category, this.message});

  AddCategoryResponse.fromJson(Map<String, dynamic> json) {
    category =
        json['category'] != null ? Category.fromJson(json['category']) : null;
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (category != null) {
      data['category'] = category!.toJson();
    }
    data['message'] = message;
    return data;
  }
}

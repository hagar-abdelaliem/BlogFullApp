import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:untitled2/models/CategoryModel.dart';
import 'package:untitled2/models/addCategoryResponse.dart';
import 'package:untitled2/models/articles_response.dart';
import 'package:untitled2/models/tags_response.dart';
import 'package:untitled2/models/user_response_model.dart';

import '../../../models/login_response_model.dart';

class ApiManager {
  static Future<UserResponse> registerUser(UserResponse user) async {
    Uri uri = Uri.http("127.0.0.1:8000", '/api/auth/register');
    http.Response response = await http.post(uri,
        body: user.toJson(), headers: {'Accept': 'application/json'});
    var bodyString = response.body;
    var json = jsonDecode(bodyString);
    var userResponse = UserResponse.fromJson(json);
    return userResponse;
  }

  static Future<LoginResponse> loginUser(UserResponse user) async {
    Uri uri = Uri.http("127.0.0.1:8000", '/api/auth/login');
    http.Response response = await http.post(uri,
        body: {'email': user.email, 'password': user.password},
        headers: {'Accept': 'application/json'});
    var bodyString = response.body;
    var json = jsonDecode(bodyString);
    var loginResponse = LoginResponse.fromJson(json);
    print("${loginResponse.token}*********************");
    return loginResponse;
  }

  static Future<TagsResponse> getTags(int categoryID) async {
    var uri = Uri.http("127.0.0.1:8000", '/api/tags');
    http.Response response = await http.get(uri);
    try {
      var bodyString = response.body;
      var json = jsonDecode(bodyString);
      var tagsResponse = TagsResponse.fromJson(json);
      return tagsResponse;
    } catch (e) {
      throw e;
    }
  }

  static Future<ArticlesResponse> getArticles(int categoryId) async {
    var uri = Uri.http("127.0.0.1:8000", '/api/articles',
        {"filters[category][categories.id][\$eq]": categoryId.toString()});
    var response = await http.get(uri);
    try {
      var bodyString = response.body;
      var json = jsonDecode(bodyString);
      var articlesResponse = ArticlesResponse.fromJson(json);
      return articlesResponse;
    } catch (e) {
      throw e;
    }
  }

  static Future<CategoryResponse> getCategories() async {
    var uri = Uri.http("127.0.0.1:8000", '/api/categories');
    var response = await http.get(uri);
    try {
      var bodyString = response.body;
      var json = jsonDecode(bodyString);
      var categoriesResponse = CategoryResponse.fromJson(json);
      return categoriesResponse;
    } catch (e) {
      throw e;
    }
  }

  static Future<AddCategoryResponse> addCategories(Category category) async {
    Uri uri = Uri.http("127.0.0.1:8000", '/api/categories');
    http.Response response = await http.post(uri,
        body: category.toJson(), headers: {'Accept': 'application/json'});
    var bodyString = response.body;
    var json = jsonDecode(bodyString);
    var categoryData = AddCategoryResponse.fromJson(json);
    return categoryData;
  }

  static Future<AddCategoryResponse> updateCategories(Category category) async {
    Uri uri = Uri.http("127.0.0.1:8000", '/api/categories/${category.id}');
    http.Response response = await http.put(uri,
        body: category.toJson(), headers: {'Accept': 'application/json'});
    var bodyString = response.body;
    var json = jsonDecode(bodyString);
    var categoryData = AddCategoryResponse.fromJson(json);
    return categoryData;
  }

  static Future<http.Response> deleteCategory(int? id) async {
    Uri uri = Uri.http("127.0.0.1:8000", '/api/categories/$id');
    http.Response response = await http.delete(uri);
    return response;
  }
}

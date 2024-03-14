import 'package:untitled2/models/CategoryModel.dart';
import 'package:untitled2/models/tags_response.dart';
import 'package:untitled2/models/user_response_model.dart';

class ArticlesResponse {
  List<Article>? articles;

  ArticlesResponse({this.articles});

  ArticlesResponse.fromJson(Map<String, dynamic> json) {
    if (json['articles'] != null) {
      articles = <Article>[];
      json['articles'].forEach((v) {
        articles!.add(Article.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    if (articles != null) {
      data['articles'] = articles!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Article {
  int? id;
  String? title;
  String? content;
  int? categoryId;
  int? userId;
  String? createdAt;
  String? updatedAt;
  List<Tag>? tags;
  UserResponse? user;
  Category? category;
  String? image; //= "assets/images/laravel.jpg";

  Article(
      {this.id,
      this.title,
      this.content,
      this.categoryId,
      this.userId,
      this.createdAt,
      this.updatedAt,
      this.tags,
      this.user,
      this.category,
      this.image});

  Article.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    content = json['content'];
    image = "assets/images/" + json['image'];
    categoryId = json['category_id'];
    userId = json['user_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    if (json['tags'] != null) {
      tags = <Tag>[];
      json['tags'].forEach((v) {
        tags!.add(Tag.fromJson(v));
      });
    }
    user = json['user'] != null ? UserResponse.fromJson(json['user']) : null;
    category =
        json['category'] != null ? Category.fromJson(json['category']) : null;
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = this.id;
    data['title'] = title;
    data['content'] = content;
    data['image'] = image;
    data['category_id'] = categoryId;
    data['user_id'] = userId;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    if (tags != null) {
      data['tags'] = tags!.map((v) => v.toJson()).toList();
    }
    if (user != null) {
      data['user'] = user!.toJson();
    }
    if (category != null) {
      data['category'] = category!.toJson();
    }
    return data;
  }
}

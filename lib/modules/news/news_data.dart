import 'package:flutter/material.dart';
import 'package:untitled2/models/CategoryModel.dart';
import 'package:untitled2/models/articles_response.dart';
import 'package:untitled2/modules/news/news_item.dart';
import 'package:untitled2/shared/network/remote/api_manager.dart';

class NewsData extends StatelessWidget {
  Category category;

  NewsData(this.category);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<ArticlesResponse>(
        future: ApiManager.getArticles(category.id!),
        builder: (_, snapShot) {
          if (snapShot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          if (snapShot.hasError) {
            return Column(
              children: [
                const Text('Something went wrong'),
                ElevatedButton(
                    onPressed: () {}, child: const Text('Try Again')),
              ],
            );
          }

          var articlesList = snapShot.data?.articles ?? [];
          return ListView.builder(
              itemCount: articlesList.length,
              itemBuilder: (c, index) {
                return NewsItem(articlesList[index]);
                // return Text(newsList[index].title ?? "");
              });
        });
  }
}

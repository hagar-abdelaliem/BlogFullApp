import 'package:flutter/material.dart';
import 'package:untitled2/models/articles_response.dart';
import 'package:untitled2/modules/news/news_content.dart';

class NewsItem extends StatelessWidget {
  Article article;

  NewsItem(this.article);

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.antiAlias,
      padding: const EdgeInsets.symmetric(horizontal: 5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          InkWell(
            onTap: () {
              Navigator.pushNamed(context, NewsContent.routeName,
                  arguments: article);
            },
            child: Image.asset(article.image!, height: 150, fit: BoxFit.fill),
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            article.user!.name ?? "",
            style: Theme.of(context).textTheme.headlineSmall,
          ),
          const SizedBox(
            height: 2,
          ),
          Text(
            article.title ?? "",
            style: Theme.of(context).textTheme.titleMedium,
          ),
          const SizedBox(
            height: 5,
          ),
          Text(
            article.createdAt ?? "",
            textAlign: TextAlign.right,
            style: Theme.of(context).textTheme.titleSmall,
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}

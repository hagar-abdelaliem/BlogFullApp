import 'package:flutter/material.dart';
import 'package:untitled2/models/articles_response.dart';

class NewsContent extends StatelessWidget {
  static const String routeName = "NewsContent";
  Article? article;

  NewsContent({super.key});

  @override
  Widget build(BuildContext context) {
    article = ModalRoute.of(context)?.settings.arguments as Article;
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Image.asset(article!.image!, height: 200, fit: BoxFit.fill),
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                child: Text(
                  article!.user!.name ?? "",
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                child: Text(
                  article!.title ?? "",
                  style: Theme.of(context).textTheme.titleMedium,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                child: Text(
                  article!.createdAt ?? "",
                  textAlign: TextAlign.right,
                  style: Theme.of(context).textTheme.titleSmall,
                ),
              ),
              Divider(),
              Padding(
                padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                child: Text(article!.content ?? "",
                    style: Theme.of(context).textTheme.bodyMedium),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

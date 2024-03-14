import 'package:flutter/material.dart';
import 'package:untitled2/models/CategoryModel.dart';
import 'package:untitled2/models/tags_response.dart';
import 'package:untitled2/modules/home/tabs_controller.dart';
import 'package:untitled2/shared/network/remote/api_manager.dart';

class NewsFragments extends StatelessWidget {
  Category category;

  NewsFragments(this.category);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: FutureBuilder<TagsResponse>(
        future: ApiManager.getTags(category.id!),
        builder: (c, snapShot) {
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

          // i have data
          var tagList = snapShot.data?.tags ?? [];
          return TabsController(tagList, category);
        },
      ),
    );
  }
}

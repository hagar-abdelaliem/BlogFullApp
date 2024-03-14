import 'package:flutter/material.dart';
import 'package:untitled2/models/CategoryModel.dart';
import 'package:untitled2/models/tags_response.dart';
import 'package:untitled2/modules/home/tab_item.dart';
import 'package:untitled2/modules/news/news_data.dart';

class TabsController extends StatefulWidget {
  List<Tag> tags;
  Category category;

  TabsController(this.tags, this.category);

  @override
  State<TabsController> createState() => _TabsControllerState();
}

class _TabsControllerState extends State<TabsController> {
  int selectedTabIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        DefaultTabController(
            length: widget.tags.length,
            child: TabBar(
              isScrollable: true,
              indicatorColor: Colors.transparent,
              onTap: (index) {
                selectedTabIndex = index;
                setState(() {});
              },
              tabs: widget.tags
                  .map((oneTag) => TabItem(
                      oneTag, selectedTabIndex == widget.tags.indexOf(oneTag)))
                  .toList(),
            )),
        Expanded(child: NewsData(widget.category)),
      ],
    );
  }
}

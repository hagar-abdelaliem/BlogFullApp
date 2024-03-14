import 'package:flutter/material.dart';
import 'package:untitled2/models/tags_response.dart';

class TabItem extends StatelessWidget {
  Tag tag;
  bool isSelected;

  TabItem(this.tag, this.isSelected);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.only(top: 8, bottom: 5),
      decoration: BoxDecoration(
        color: isSelected ? Colors.green : Colors.transparent,
        borderRadius: BorderRadius.circular(15),
        border: Border.all(color: Colors.green),
      ),
      child: Text(
        '${tag.name}',
        style: TextStyle(color: isSelected ? Colors.white : Colors.green),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:news/screens/category_item_detailes/news_content.dart';
import 'package:news/screens/category_item_detailes/news_detailes.dart';
import 'package:news/screens/category_item_detailes/tab_bar.dart';

class CategoryItemDetailes extends StatelessWidget {
  CategoryItemDetailes(this.categoryId, {super.key});

  String categoryId;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TabBarWidget(),
        SizedBox(
          height: 16,
        ),
        Expanded(
          child: InkWell(onTap: () {}, child: NewsContent()),
        ),
      ],
    );
  }
}

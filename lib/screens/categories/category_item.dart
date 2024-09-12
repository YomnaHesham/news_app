import 'package:flutter/material.dart';
import 'package:news/screens/categories/category_item_model.dart';

class CategoryItem extends StatelessWidget {
  CategoryItemModel model;
  bool isOdd;

  CategoryItem({required this.model, required this.isOdd, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: model.bgColor,
        borderRadius: BorderRadius.only(
          topRight: const Radius.circular(25),
          topLeft: const Radius.circular(25),
          bottomLeft: !isOdd ? const Radius.circular(25) : Radius.zero,
          bottomRight: isOdd ? const Radius.circular(25) : Radius.zero,
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: Image.asset(
              "assets/images/${model.img}.png",
              width: 118,
              height: 118,
            ),
          ),
          Text(
            model.lable,
            style: Theme.of(context).textTheme.titleMedium,
          ),
        ],
      ),
    );
  }
}

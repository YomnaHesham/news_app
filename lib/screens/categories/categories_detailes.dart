import 'package:flutter/material.dart';
import 'package:news/screens/categories/category_item.dart';
import 'package:news/screens/categories/category_item_model.dart';

class CategoriesDetailes extends StatelessWidget {
  CategoriesDetailes({super.key});

  @override
  Widget build(BuildContext context) {
    List<CategoryItemModel> items = [
      CategoryItemModel(
        bgColor: Color(0xFFC91C22),
        lable: "Sport",
        img: "ball",
      ),
      CategoryItemModel(
        bgColor: Color(0xFF003E90),
        lable: "Politics",
        img: "Politics",
      ),
      CategoryItemModel(
        bgColor: Color(0xFFED1E79),
        lable: "Health",
        img: "health",
      ),
      CategoryItemModel(
        bgColor: Color(0xFFCF7E48),
        lable: "Business",
        img: "bussines",
      ),
      CategoryItemModel(
        bgColor: Color(0xFF4882CF),
        lable: "Environment",
        img: "environment",
      ),
      CategoryItemModel(
        bgColor: Color(0xFFF2D352),
        lable: "Science",
        img: "science",
      ),
    ];
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 26.0),
            child: Text(
              "Pick your category of interest",
              style: Theme.of(context).textTheme.titleLarge,
            ),
          ),
          Expanded(
            child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 25,
                mainAxisSpacing: 20,
              ),
              itemBuilder: (context, index) {
                return CategoryItem(model: items[index], isOdd: index.isOdd);
              },
              itemCount: items.length,
            ),
          )
        ],
      ),
    );
  }
}

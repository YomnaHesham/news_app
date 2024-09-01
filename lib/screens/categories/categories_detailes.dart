import 'package:flutter/material.dart';
import 'package:news/screens/categories/category_item.dart';
import 'package:news/screens/categories/category_item_model.dart';

class CategoriesDetailes extends StatelessWidget {
  CategoriesDetailes({super.key, required this.onCategorySelect});

  void Function(CategoryItemModel) onCategorySelect;

  @override
  Widget build(BuildContext context) {
    List<CategoryItemModel> items = [
      CategoryItemModel(
        id: "Sport",
        bgColor: Color(0xFFC91C22),
        lable: "Sport",
        img: "ball",
      ),
      CategoryItemModel(
        id: "Politics",
        bgColor: Color(0xFF003E90),
        lable: "Politics",
        img: "Politics",
      ),
      CategoryItemModel(
        id: "Health",
        bgColor: Color(0xFFED1E79),
        lable: "Health",
        img: "health",
      ),
      CategoryItemModel(
        id: "Business",
        bgColor: Color(0xFFCF7E48),
        lable: "Business",
        img: "bussines",
      ),
      CategoryItemModel(
        id: "Environment",
        bgColor: Color(0xFF4882CF),
        lable: "Environment",
        img: "environment",
      ),
      CategoryItemModel(
        id: "Science",
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
                return GestureDetector(
                    onTap: () => onCategorySelect(items[index]),
                    child:
                        CategoryItem(model: items[index], isOdd: index.isOdd));
              },
              itemCount: items.length,
            ),
          )
        ],
      ),
    );
  }
}

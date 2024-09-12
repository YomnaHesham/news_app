import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:news/screens/categories/category_item.dart';
import 'package:news/screens/categories/category_item_model.dart';

class CategoriesDetailes extends StatelessWidget {
  CategoriesDetailes({super.key, required this.onCategorySelect});

  void Function(CategoryItemModel) onCategorySelect;

  @override
  Widget build(BuildContext context) {
    List<CategoryItemModel> items = CategoryItemModel.getCategories();
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 22.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 26.0),
            child: Text(
              "category_interest".tr(),
              style: Theme.of(context).textTheme.titleLarge,
            ),
          ),
          Expanded(
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 22,
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
          ),
          const SizedBox(height: 20,)
        ],
      ),
    );
  }
}

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:news/app_theme.dart';
import 'package:news/screens/categories/categories_detailes.dart';
import 'package:news/screens/categories/category_item_model.dart';
import 'package:news/screens/drawer.dart';
import 'package:news/screens/settings/settings.dart';
import 'package:news/screens/category_item_detailes/tab_bar.dart';

class HomeScreen extends StatefulWidget {
  static const String routName = "home";

  HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedTabIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: AppTheme.white,
        image: DecorationImage(
          image: AssetImage("assets/images/bg.png"),
          fit: BoxFit.cover,
        ),
      ),
      child: Scaffold(
        drawer: HomeDrawer(
          onItemSelection: OnDrawerItemSelection,
        ),
        appBar: AppBar(
          iconTheme: const IconThemeData(color: AppTheme.white, size: 32),
          title: Text(
            "news".tr(),
          ),
          actions: [
            IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.search,
                color: AppTheme.white,
                size: 32,
              ),
            )
          ],
        ),
        body: categoryItemModel != null
            ? TabBarWidget(categoryId: categoryItemModel!.id)
            : selectedDrawerItem == DrawerItem.categories
                ? CategoriesDetailes(
                    onCategorySelect: OnCategoryItemSelection,
                  )
                :  Settings(),
      ),
    );
  }

  DrawerItem selectedDrawerItem = DrawerItem.categories;

  CategoryItemModel? categoryItemModel;

  void OnDrawerItemSelection(DrawerItem drawerItemSelect) {
    selectedDrawerItem = drawerItemSelect;
    categoryItemModel = null;
    setState(() {});
    Navigator.of(context).pop();
  }

  void OnCategoryItemSelection(CategoryItemModel categoryItemSelect) {
    categoryItemModel = categoryItemSelect;
    setState(() {});
  }
}

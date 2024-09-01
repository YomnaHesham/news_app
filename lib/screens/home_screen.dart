import 'package:flutter/material.dart';
import 'package:news/apis/api_manager.dart';
import 'package:news/app_theme.dart';
import 'package:news/screens/categories/categories_detailes.dart';
import 'package:news/screens/drawer.dart';
import 'package:news/screens/news_content.dart';
import 'package:news/screens/settings/settings.dart';
import 'package:news/screens/tab_bar.dart';

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
          iconTheme: IconThemeData(color: AppTheme.white, size: 32),
          title: const Text(
            "News App",
          ),
          actions: [
            IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.search,
                color: AppTheme.white,
                size: 32,
              ),
            )
          ],
        ),
        body: selectedDrawerItem == DrawerItem.categories
            ? CategoriesDetailes()
            : const Settings(),
        // Column(
        //   children: [
        //     TabBarWidget(),
        //     SizedBox(
        //       height: 16,
        //     ),
        //     NewsContent(),
        //   ],
        // ),
      ),
    );
  }

  DrawerItem selectedDrawerItem = DrawerItem.categories;

  void OnDrawerItemSelection(DrawerItem drawerItemSelect) {
    selectedDrawerItem = drawerItemSelect;
    setState(() {});
    Navigator.of(context).pop();
  }
}

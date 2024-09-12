import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:news/apis/api_manager.dart';
import 'package:news/app_theme.dart';
import 'package:news/models/news_data_response.dart';
import 'package:news/screens/categories/categories_detailes.dart';
import 'package:news/screens/categories/category_item.dart';
import 'package:news/screens/categories/category_item_model.dart';
import 'package:news/screens/category_item_detailes/news_item.dart';
import 'package:news/screens/drawer.dart';
import 'package:news/screens/settings/settings.dart';
import 'package:news/screens/category_item_detailes/tab_bar.dart';
import 'package:news/search.dart';

class HomeScreen extends StatefulWidget {
  static const String routName = "home";

  HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool onSearchClick = false;
  TextEditingController searchController = TextEditingController();
  Future<NewsDataResponse>? searchResults;

  void onSearch() {
    if (searchController.text.isNotEmpty) {
      setState(() {
        searchResults = ApiManager.searchNews(searchController.text);
      });
    }
  }

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
          appBar: !onSearchClick
              ? PreferredSize(
                  preferredSize: const Size.fromHeight(60.0),
                  child: AppBar(
                    title: Text(
                      "news".tr(),
                    ),
                    actions: [
                      IconButton(
                        onPressed: () {
                          onSearchClick = !onSearchClick;
                          setState(() {});
                        },
                        icon: const Icon(
                          Icons.search,
                          color: AppTheme.white,
                          size: 32,
                        ),
                      )
                    ],
                  ),
                )
              : PreferredSize(
                  preferredSize: const Size.fromHeight(60.0),
                  child: AppBar(
                    title: TextField(
                      controller: searchController,
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                        prefixIcon: IconButton(
                          onPressed: onSearch,
                          icon: const Icon(
                            Icons.search,
                            size: 24,
                            color: AppTheme.primary,
                          ),
                        ),
                        suffixIcon: IconButton(
                          onPressed: () {
                            setState(() {
                              onSearchClick = false;
                              searchResults = null;
                              searchController.clear();
                            });
                          },
                          icon: const Icon(
                            Icons.clear,
                            size: 24,
                            color: AppTheme.primary,
                          ),
                        ),
                        hintText: "Search",
                        hintStyle: Theme.of(context)
                            .textTheme
                            .bodyMedium!
                            .copyWith(color: AppTheme.primary),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(32),
                          borderSide: BorderSide.none,
                        ),
                        fillColor: AppTheme.white,
                        filled: true,
                      ),
                      cursorColor: AppTheme.primary,
                      onSubmitted: (value) => onSearch(),
                    ),
                  ),
                ),
          body: searchResults == null
              ? categoryItemModel != null
                  ? TabBarWidget(categoryId: categoryItemModel!.id)
                  : selectedDrawerItem == DrawerItem.categories
                      ? CategoriesDetailes(
                          onCategorySelect: OnCategoryItemSelection,
                        )
                      : const Settings()
              : ListView.separated(
                  itemBuilder: (context, index) {
                    var article;
                    return NewsItem(
                      article: article,
                    );
                  },
                  separatorBuilder: (context, index) => const SizedBox(
                        height: 8,
                      ),
                  itemCount: 5)),
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

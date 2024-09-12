import 'dart:async';
import 'package:flutter/material.dart';
import 'package:news/apis/api_manager.dart';
import 'package:news/app_theme.dart';
import 'package:news/models/news_data_response.dart';

class Search extends StatefulWidget {
  const Search({super.key});

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  bool onSearchClick = false;
  TextEditingController searchController = TextEditingController();
  Future<NewsDataResponse>? searchResults;

  void _onSearch() {
    if (searchController.text.isNotEmpty) {
      setState(() {
        searchResults = ApiManager.searchNews(searchController.text);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: searchController,
      keyboardType: TextInputType.text,
      decoration: InputDecoration(
        prefixIcon: IconButton(
          onPressed: _onSearch,
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
      onSubmitted: (value) => _onSearch(),
    );
  }
}

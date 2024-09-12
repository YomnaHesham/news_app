import 'package:flutter/material.dart';
import 'package:news/apis/api_manager.dart';
import 'package:news/app_theme.dart';
import 'package:news/screens/category_item_detailes/news_detailes.dart';
import 'package:news/screens/category_item_detailes/news_item.dart';
import 'package:news/screens/category_item_detailes/tab_item.dart';

class TabBarWidget extends StatefulWidget {
  String categoryId;

  TabBarWidget({required this.categoryId, super.key});

  @override
  State<TabBarWidget> createState() => _TabBarWidgetState();
}

class _TabBarWidgetState extends State<TabBarWidget> {
  int selectedTabIndex = 0;
  int selectedNewIndex = 0;

  bool onNewsItemClick = false;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: ApiManager.getSource(widget.categoryId),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(
              color: AppTheme.primary,
            ),
          );
        }
        if (snapshot.hasError || snapshot.data?.status != "ok") {
          return const Center(child: Text("Something Went Wrong"));
        }
        var sources = snapshot.data?.sources ?? [];
        return Column(
          children: [
            DefaultTabController(
              length: sources.length,
              child: TabBar(
                onTap: (value) {
                  selectedTabIndex = value;
                  setState(() {});
                },
                isScrollable: true,
                indicatorColor: Colors.transparent,
                dividerColor: Colors.transparent,
                tabAlignment: TabAlignment.start,
                tabs: sources
                    .map(
                      (e) => TabItem(
                        source: e,
                        isSelected: sources.elementAt(selectedTabIndex) == e,
                      ),
                    )
                    .toList(),
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            FutureBuilder(
              future:
                  ApiManager.getNewsData(sources[selectedTabIndex].id ?? ""),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(
                    child: CircularProgressIndicator(
                      color: AppTheme.primary,
                    ),
                  );
                }
                if (snapshot.hasError) {
                  return const Center(child: Text("Something Went Wrong"));
                }
                var articles = snapshot.data?.articles ?? [];
                return !onNewsItemClick
                    ? Expanded(
                        child: ListView.separated(
                          separatorBuilder: (context, index) => const SizedBox(
                            height: 16,
                          ),
                          itemBuilder: (context, index) {
                            return GestureDetector(
                                onTap: () {
                                  onNewsItemClick = !onNewsItemClick;
                                  selectedNewIndex = index;
                                  setState(() {});
                                },
                                child: NewsItem(article: articles[index]));
                          },
                          itemCount: articles.length,
                        ),
                      )
                    : NewsDetailes(article: articles[selectedNewIndex]);
              },
            )
          ],
        );
      },
    );
  }
}

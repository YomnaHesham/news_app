import 'package:flutter/material.dart';
import 'package:news/apis/api_manager.dart';
import 'package:news/screens/tab_item.dart';

class TabBarWidget extends StatefulWidget {
  const TabBarWidget({super.key});

  @override
  State<TabBarWidget> createState() => _TabBarWidgetState();
}

class _TabBarWidgetState extends State<TabBarWidget> {
  int selectedTabIndex = 0;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: ApiManager.getSource(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
        if (snapshot.hasError) {
          return Text("Somting Went Wrong");
        }
        var sources = snapshot.data?.sources ?? [];
        return DefaultTabController(
            length: sources.length,
            child: TabBar(
                onTap: (value) {
                  selectedTabIndex = value;
                  setState(() {});
                },
                isScrollable: true,
                indicatorColor: Colors.transparent,
                dividerColor: Colors.transparent,
                tabs: sources
                    .map((e) => TabItem(
                  source: e,
                  isSelected:
                  sources.elementAt(selectedTabIndex) == e,
                ))
                    .toList()));
      },
    );
  }
}

import 'package:flutter/material.dart';
import 'package:news/apis/api_manager.dart';

class NewsContent extends StatelessWidget {
  const NewsContent({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: ApiManager.getNewsData("abc-news"),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
        if (snapshot.hasError) {
          return Text("Somting Went Wrong");
        }
        var articles = snapshot.data?.articles ?? [];
        return Expanded(
          child: ListView.separated(
            separatorBuilder: (context, index) => SizedBox(
              height: 16,
            ),
            itemBuilder: (context, index) {
              return Column(
                children: [
                  // Image.asset(articles[index].urlToImage ?? ""),
                  Text(articles[index].title ?? ""),
                ],
              );
            },
            itemCount: articles.length,
          ),
        );
      },
    );
  }
}

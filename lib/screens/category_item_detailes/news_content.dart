import 'package:flutter/material.dart';
import 'package:news/apis/api_manager.dart';
import 'package:timeago/timeago.dart' as timeago;

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
          return Center(child: Text("Somting Went Wrong"));
        }
        var articles = snapshot.data?.articles ?? [];
        return Expanded(
          child: ListView.separated(
            separatorBuilder: (context, index) => SizedBox(
              height: 16,
            ),
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(5),
                      child: Image.asset(
                        articles[index].urlToImage ?? "",
                        height: MediaQuery.of(context).size.height * 0.25,
                        fit: BoxFit.fill,
                      ),
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Text(
                      "source",
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                    Text(
                      articles[index].title ?? "",
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                    Align(
                      alignment: AlignmentDirectional.centerEnd,
                      child: Text(
                        timeago.format(DateTime(2024, 8, 1)),
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                    ),
                  ],
                ),
              );
            },
            itemCount: articles.length,
          ),
        );
      },
    );
  }
}

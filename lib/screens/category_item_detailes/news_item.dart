import 'package:flutter/material.dart';
import 'package:news/app_theme.dart';
import 'package:news/models/news_data_response.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'package:cached_network_image/cached_network_image.dart';

class NewsItem extends StatelessWidget {
  Articles article;

  NewsItem({required this.article, super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(5),
            child: CachedNetworkImage(
              imageUrl: article.urlToImage ?? "",
              height: MediaQuery.of(context).size.height * 0.25,
              width: double.infinity,
              fit: BoxFit.fill,
              placeholder: (context, url) => const Center(
                child: CircularProgressIndicator(
                  color: AppTheme.primary,
                ),
              ),
              errorWidget: (context, url, error) => const Icon(Icons.error),
            ),
          ),
          const SizedBox(
            height: 8,
          ),
          Text(
            textAlign: TextAlign.left,
            article.author ?? "",
            style: Theme.of(context).textTheme.bodySmall,
          ),
          Text(
            article.title ?? "",
            textAlign: TextAlign.left,
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          Text(
            article.description ?? "",
            textAlign: TextAlign.left,
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          Align(
            alignment: AlignmentDirectional.centerEnd,
            child: Text(
              article.publishedAt!.substring(0, 10),
              // timeago.format(DateTime(article.publishedAt as int)),
              style: Theme.of(context).textTheme.bodySmall,
            ),
          ),
        ],
      ),
    );
    ;
  }
}

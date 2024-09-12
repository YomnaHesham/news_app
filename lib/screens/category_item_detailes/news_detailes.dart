import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:news/app_theme.dart';
import 'package:news/models/news_data_response.dart';
import 'package:url_launcher/url_launcher.dart';

class NewsDetailes extends StatelessWidget {
  Articles article;

  NewsDetailes({required this.article, super.key});

  @override
  Widget build(BuildContext context) {
    final Uri _url = Uri.parse(article.url ??
        "https://www.wired.com/story/the-worlds-biggest-bitcoin-mine-is-rattling-this-texas-oil-town/");
    Future<void> _launchUrl() async {
      if (await canLaunchUrl(_url)) {
        await launchUrl(_url);
      } else {
        throw Exception('Could not launch $_url');
      }
    }

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 24.0),
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
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
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
                Align(
                  alignment: AlignmentDirectional.centerEnd,
                  child: Text(
                    article.publishedAt!.substring(0, 10),
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                Card(
                  color: AppTheme.white,
                  child: Container(
                    padding: const EdgeInsets.all(24.0),
                    child: Column(
                      children: [
                        Text(
                          article.description ?? "",
                          textAlign: TextAlign.left,
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                        Align(
                          alignment: AlignmentDirectional.centerEnd,
                          child: InkWell(
                            onTap: () {
                              _launchUrl;
                            },
                            child: const Text("View Full Article"),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

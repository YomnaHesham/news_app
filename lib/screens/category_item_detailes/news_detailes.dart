import 'package:flutter/material.dart';
import 'package:news/app_theme.dart';
import 'package:timeago/timeago.dart' as timeago;

class NewsDetailes extends StatelessWidget {
  const NewsDetailes({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(5),
            child: Image.asset(
              "",
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
            "Why are football's biggest clubs starting a new tournament?",
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          Align(
            alignment: AlignmentDirectional.centerEnd,
            child: Text(
              timeago.format(DateTime(2024, 8, 1)),
              style: Theme.of(context).textTheme.bodySmall,
            ),
          ),
          SizedBox(
            height: 16,
          ),
          Card(
            color: AppTheme.white,
            margin: const EdgeInsets.all(8),
            child: Container(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                children: [
                  Text(
                    "Why are football's biggest clubs starting a new tournament Why are football's biggest clubs starting a new tournament Why are football's biggest clubs starting a new tournament Why are football's biggest clubs starting a new tournament?",
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  Align(
                    alignment: AlignmentDirectional.centerEnd,
                    child: InkWell(
                      onTap: () {},
                      child: Text("View Full Article"),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

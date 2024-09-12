import 'package:flutter/material.dart';
import 'package:news/app_theme.dart';
import 'package:news/models/sources_response.dart';

class TabItem extends StatelessWidget {
  Sources source;
  bool isSelected;

  TabItem({required this.source, required this.isSelected, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 24),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: isSelected ? AppTheme.primary  : Colors.transparent,
        borderRadius: BorderRadius.circular(25),
        border: Border.all(
          color: AppTheme.primary
        ),
      ),
      child: Text(source.name ?? "",
          style: Theme.of(context)
              .textTheme
              .titleSmall!
              .copyWith(color: isSelected ? AppTheme.white : AppTheme.primary)),
    );
  }
}

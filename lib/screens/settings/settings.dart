import 'package:flutter/material.dart';
import 'package:news/app_theme.dart';
import 'package:news/screens/settings/language_bottom_sheet.dart';

class Settings extends StatelessWidget {
  const Settings({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Language",
            style: Theme.of(context)
                .textTheme
                .titleLarge!
                .copyWith(color: AppTheme.black),
          ),
          SizedBox(
            height: 16,
          ),
          InkWell(
            onTap: () {
              showModalBottomSheet(
                isDismissible: true,
                isScrollControlled: true,
                context: context,
                builder: (context) {
                  return LanguageBottomSheet();
                },
              );
            },
            child: Container(
              width: double.infinity,
              padding: EdgeInsets.all(12),
              decoration: BoxDecoration(
                border: Border.all(
                  width: 2,
                  color: AppTheme.primary,
                ),
                borderRadius: BorderRadius.circular(16),
                color: AppTheme.white,
              ),
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      "English",
                      style: Theme.of(context).textTheme.titleSmall,
                    ),
                  ),
                  Icon(Icons.arrow_drop_down_outlined,color: AppTheme.primary,),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

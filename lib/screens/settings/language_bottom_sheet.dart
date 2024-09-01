import 'package:flutter/material.dart';
import 'package:news/app_theme.dart';

class LanguageBottomSheet extends StatelessWidget {
  const LanguageBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.5,
      decoration: BoxDecoration(
        color: AppTheme.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(25),
          topRight: Radius.circular(25),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          children: [
            InkWell(
              onTap: () {
                // context.setLocale(Locale("ar"));
                Navigator.pop(context);
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "English",
                    style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                          color: AppTheme.primary,
                        ),
                  ),
                  Icon(Icons.done, size: 30, color: AppTheme.primary)
                ],
              ),
            ),
            SizedBox(
              height: 24,
            ),
            InkWell(
              onTap: () {
                // context.setLocale(Locale("en"));
                Navigator.pop(context);
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Arabic",
                    style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                          color: AppTheme.black,
                        ),
                  ),
                  SizedBox(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

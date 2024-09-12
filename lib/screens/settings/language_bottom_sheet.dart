import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:news/app_theme.dart';
import 'package:provider/provider.dart';

class LanguageBottomSheet extends StatelessWidget {
  const LanguageBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {

    return Container(
      height: MediaQuery.of(context).size.height * 0.5,
      decoration: const BoxDecoration(
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
                context.setLocale(const Locale("en"));
                Navigator.pop(context);
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "english".tr(),
                    style: context.locale == const Locale("en")
                        ? Theme.of(context).textTheme.titleMedium!.copyWith(
                              color: AppTheme.primary,
                            )
                        : Theme.of(context).textTheme.titleMedium!.copyWith(
                              color: AppTheme.black,
                            ),
                  ),
                  context.locale == const Locale("en")
                      ? const Icon(
                          Icons.done,
                          size: 30,
                          color: AppTheme.primary,
                        )
                      : const SizedBox(),
                ],
              ),
            ),
            const SizedBox(
              height: 24,
            ),
            InkWell(
              onTap: () {
                context.setLocale(const Locale("ar"));
                Navigator.pop(context);
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "arabic".tr(),
                    style: context.locale == const Locale("ar")
                        ? Theme.of(context).textTheme.titleMedium!.copyWith(
                              color: AppTheme.primary,
                            )
                        : Theme.of(context).textTheme.titleMedium!.copyWith(
                              color: AppTheme.black,
                            ),
                  ),
                  context.locale == const Locale("ar")
                      ? const Icon(
                          Icons.done,
                          size: 30,
                          color: AppTheme.primary,
                        )
                      : const SizedBox(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

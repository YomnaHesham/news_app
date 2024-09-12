import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:news/app_theme.dart';

class HomeDrawer extends StatelessWidget {
  void Function(DrawerItem) onItemSelection;

  HomeDrawer({required this.onItemSelection, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.8,
      color: AppTheme.white,
      child: Column(
        children: [
          Container(
            color: AppTheme.primary,
            height: MediaQuery.of(context).size.height * 0.2,
            width: double.infinity,
            child: Center(
              child: Text(
                "news".tr(),
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      color: AppTheme.white,
                    ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                const SizedBox(
                  height: 16,
                ),
                InkWell(
                  onTap: () => onItemSelection(DrawerItem.categories),
                  child: Row(
                    children: [
                      const Icon(
                        Icons.list,
                        color: AppTheme.black,
                        size: 32,
                      ),
                      const SizedBox(
                        width: 16,
                      ),
                      Text(
                        "categories".tr(),
                        style: Theme.of(context).textTheme.titleLarge!.copyWith(
                              color: AppTheme.black,
                            ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                InkWell(
                  onTap: () => onItemSelection(DrawerItem.settings),
                  child: Row(
                    children: [
                      const Icon(
                        Icons.settings,
                        color: AppTheme.black,
                        size: 32,
                      ),
                      const SizedBox(
                        width: 16,
                      ),
                      Text(
                        "settings".tr(),
                        style: Theme.of(context).textTheme.titleLarge!.copyWith(
                              color: AppTheme.black,
                            ),
                      ),
                    ],
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

enum DrawerItem {
  categories,
  settings;
}

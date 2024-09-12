import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class CategoryItemModel {
  String id;
  Color bgColor;
  String lable;
  String img;

  CategoryItemModel(
      {required this.id,
      required this.bgColor,
      required this.lable,
      required this.img});

  static List<CategoryItemModel> getCategories() {
    return [
      CategoryItemModel(
        id: "business",
        bgColor: Color(0xFFCF7E48),
        lable: "business".tr(),
        img: "bussines",
      ),
      CategoryItemModel(
        id: "entertainment",
        bgColor: Color(0xFF003E90),
        lable: "entertainment".tr(),
        img: "Politics",
      ),
      CategoryItemModel(
        id: "general",
        bgColor: Color(0xFF4882CF),
        lable: "general".tr(),
        img: "environment",
      ),
      CategoryItemModel(
        id: "health",
        bgColor: Color(0xFFED1E79),
        lable: "health".tr(),
        img: "health",
      ),
      CategoryItemModel(
        id: "science",
        bgColor: Color(0xFFF2D352),
        lable: "science".tr(),
        img: "science",
      ),
      CategoryItemModel(
        id: "sports",
        bgColor: Color(0xFFC91C22),
        lable: "sports".tr(),
        img: "ball",
      ),
      CategoryItemModel(
        id: "technology",
        bgColor: Colors.purple,
        lable: "technology".tr(),
        img: "science",
      ),
    ];
  }
}

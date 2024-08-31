import 'package:flutter/material.dart';
import 'package:news/sources_response.dart';

class TabItem extends StatelessWidget {
  Sources source;
  bool isSelected;

  TabItem({required this.source, required this.isSelected, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 24),
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: isSelected ? Color(0xFF39A552) : Colors.transparent,
        borderRadius: BorderRadius.circular(25),
        border: Border.all(
          color: Color(0xFF39A552),
        ),
      ),
      child: Text(
        source.name ?? "",
        style: TextStyle(
          color: isSelected ? Colors.white : Color(0xFF39A552),
          fontWeight: FontWeight.w400,
          fontSize: 14,
        ),
      ),
    );
  }
}

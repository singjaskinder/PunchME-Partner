import 'package:flutter/material.dart';
import 'package:punchmepartner/res/app_colors.dart';

import 'sizedbox.dart';
import 'text.dart';

class ContentDivider extends StatelessWidget {
  ContentDivider(
      {this.title,
      this.fontSize = 0.8,
      this.fontColor = AppColors.lightGrey,
      this.barColor = AppColors.lightGrey,
      this.barSize = 2});
  final String title;
  final double fontSize;
  final Color fontColor;
  final Color barColor;
  final double barSize;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
              child: Container(
            height: barSize,
            color: barColor,
          )),
          JxSizedBox(width: 0.5),
          JxText(
            title,
            size: fontSize,
          ),
          JxSizedBox(width: 0.5),
          Expanded(
              flex: 15,
              child: Container(
                height: barSize,
                color: barColor,
              ))
        ],
      ),
    );
  }
}

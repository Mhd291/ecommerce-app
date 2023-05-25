import 'package:flutter/material.dart';

import 'package:my_application/constant.dart';

class customButton extends StatelessWidget {
  double width;
  double height;
  String buttonName;
  Color? color;
  Color? fontColor;
  double? fontSize;
  Function() onTab;

  customButton({
    required this.width,
    required this.height,
    required this.buttonName,
    required this.onTab,
    this.color,
    this.fontColor,
    this.fontSize,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTab,
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50),
          color: color ?? white,
        ),
        child: Center(
          child: Text(
            buttonName,
            style: TextStyle(
              fontSize: fontSize ?? 20,
              color: fontColor ?? black,
            ),
          ),
        ),
      ),
    );
  }
}

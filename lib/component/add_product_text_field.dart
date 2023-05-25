import 'package:flutter/material.dart';

import '../constant.dart';

class addProductTextField extends StatelessWidget {
  final String des;
  final double width, height;
  final String hintText;
  final Color? textcolor;
  final TextInputType? keyboard;
  final Function(String) onChanged;
  addProductTextField({
    required this.des,
    required this.height,
    required this.width,
    required this.hintText,
    required this.onChanged,
    this.keyboard,
    this.textcolor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
        color: white.withAlpha(40),
        border: Border(
          bottom: BorderSide(color: white.withAlpha(60)),
          top: BorderSide(color: white.withAlpha(60)),
          left: BorderSide(color: white.withAlpha(60)),
          right: BorderSide(color: white.withAlpha(60)),
        ),
      ),
      child: Row(
        children: [
          Text(
            des,
            style: TextStyle(fontSize: 20, color: white),
          ),
          TextField(
            onChanged: onChanged,
            keyboardType: keyboard ?? TextInputType.text,
            cursorColor: white,
            style: TextStyle(color: textcolor ?? white, fontSize: 20),
            decoration: InputDecoration(
              border: InputBorder.none,
              hintText: hintText,
              hintStyle: const TextStyle(color: white, fontSize: 20),
              contentPadding: const EdgeInsets.fromLTRB(20, 8, 8, 8),
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';

class ButtonNumberModel extends StatelessWidget {
  String title = '';
  Color color;
  VoidCallback onTap;
  double fontSize;
  ButtonNumberModel(
      {required this.title,
        required this.onTap,
        this.color = const Color(0xff7f7f80),
        this.fontSize = 45});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        alignment: Alignment.center,
        margin: const EdgeInsets.all(8),
        decoration:
        BoxDecoration(color: color, borderRadius: BorderRadius.circular(8)),
        child: Text(
          title,
          style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: fontSize),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

import '../const_value.dart';

class NumberScreenCalcModel extends StatelessWidget {
  const NumberScreenCalcModel({
    super.key,
    required this.outText,
  });

  final String outText;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerRight,
      width: double.infinity,
      height: 110,
      decoration: BoxDecoration(
          color: const Color(0xffcfe5a7),
          borderRadius: BorderRadius.circular(15)),
      child: FittedBox(
        fit: BoxFit.fitWidth,
        child: Text(
          outText == '' ? '0' : outText,
          style: const TextStyle(
              fontFamily: ConstValueModel.fontFamily, fontSize: 80),
        ),
      ),
    );
  }
}

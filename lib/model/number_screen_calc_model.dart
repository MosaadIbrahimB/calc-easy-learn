import 'package:flutter/material.dart';

import '../const_value.dart';

class NumberScreenCalcModel extends StatelessWidget {
  const NumberScreenCalcModel({
    super.key,
    required this.outText,
    required this.eqlText,
  });

  final String outText;
  final String eqlText;

  @override
  Widget build(BuildContext context) {
    return Container(
height: MediaQuery.of(context).size.height*.17,
      padding: const EdgeInsets.symmetric(horizontal: 5),
      width: double.infinity,
      decoration: BoxDecoration(
          color: const Color(0xffcfe5a7),
          borderRadius: BorderRadius.circular(15)),
      child: Column(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height*(.07),
            child: Align(
              alignment: Alignment.topLeft,
              child: FittedBox(
                child: Row(
                  children: [
                    Text(
                      outText == '' ? '0' : outText,
                      style: const TextStyle(
                          fontFamily: ConstValueModel.fontFamily, fontSize:30),
                    ),
                  ],
                ),
              ),
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height*(.1),
            child: Align(
              alignment: Alignment.centerRight,
              child: FittedBox(
                child: Row(
                  children: [
                    Text(
                      eqlText == '' ? '0' : eqlText,
                      style: const TextStyle(
                          fontFamily: ConstValueModel.fontFamily, fontSize: 60),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

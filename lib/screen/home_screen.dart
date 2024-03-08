import 'dart:math';

import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

import '../model/button_number_model.dart';
import '../model/number_screen_calc_model.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String outText = '';
  String clearSign = String.fromCharCode(9003);
  List<String> op = ["+", "-", "×", "÷", '.', '=', '%'];
  int dotStringCount = 0;
  String resulteString = '';
  String eqStringOpView = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff4d4d4d),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              const SizedBox(
                height: 30,
              ),
              NumberScreenCalcModel(
                outText: outText == "" ? eqStringOpView : outText,
                eqlText: resulteString,
              ),
              // NumberScreenCalcModel(outText: eqString),
              const SizedBox(height: 30),
              Expanded(
                flex: 9,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: ButtonNumberModel(
                            title: "√",
                            onTap: () {
                              sqr();
                            },
                          ),
                        ),
                        Expanded(
                          child: ButtonNumberModel(
                            title: "x²",
                            onTap: () {
                              quadrature();
                            },
                          ),
                        ),
                        Expanded(
                          child: ButtonNumberModel(
                            title: "M",
                            onTap: () {
                              onMemory();
                            },
                          ),
                        ),
                        Expanded(
                          child: ButtonNumberModel(
                            title: "%",
                            onTap: () {
                              onTap('%');
                            },
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: ButtonNumberModel(
                            title: "AC",
                            onTap: () {
                              onTapAC();
                            },
                            color: const Color(0xff65c6cf),
                          ),
                        ),
                        Expanded(
                          child: ButtonNumberModel(
                            title: "(",
                            onTap: () {
                              onTap("(");
                            },
                          ),
                        ),
                        Expanded(
                          child: ButtonNumberModel(
                            title: ")",
                            onTap: () {
                              onTap(")");
                            },
                          ),
                        ),
                        Expanded(
                          child: ButtonNumberModel(
                            title: clearSign,
                            onTap: () {
                              onTapBackSpace();
                            },
                            color: const Color(0xff65c6cf),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: ButtonNumberModel(
                            title: "7",
                            onTap: () {
                              onTap("7");
                            },
                          ),
                        ),
                        Expanded(
                          child: ButtonNumberModel(
                            title: "8",
                            onTap: () {
                              onTap("8");
                            },
                          ),
                        ),
                        Expanded(
                          child: ButtonNumberModel(
                            title: "9",
                            onTap: () {
                              onTap("9");
                            },
                          ),
                        ),
                        Expanded(
                          child: ButtonNumberModel(
                            title: "÷",
                            onTap: () {
                              onTap("/");
                            },
                            color: const Color(0xff65c6cf),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: ButtonNumberModel(
                            title: "4",
                            onTap: () {
                              onTap("4");
                            },
                          ),
                        ),
                        Expanded(
                          child: ButtonNumberModel(
                            title: "5",
                            onTap: () {
                              onTap("5");
                            },
                          ),
                        ),
                        Expanded(
                          child: ButtonNumberModel(
                            title: "6",
                            onTap: () {
                              onTap("6");
                            },
                          ),
                        ),
                        Expanded(
                          child: ButtonNumberModel(
                            title: "×",
                            onTap: () {
                              onTap("*");
                            },
                            color: const Color(0xff65c6cf),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: ButtonNumberModel(
                            title: "1",
                            onTap: () {
                              onTap("1");
                            },
                          ),
                        ),
                        Expanded(
                          child: ButtonNumberModel(
                            title: "2",
                            onTap: () {
                              onTap("2");
                            },
                          ),
                        ),
                        Expanded(
                          child: ButtonNumberModel(
                            title: "3",
                            onTap: () {
                              onTap("3");
                            },
                          ),
                        ),
                        Expanded(
                          child: ButtonNumberModel(
                            title: "-",
                            onTap: () {
                              onTap("-");
                            },
                            color: const Color(0xff65c6cf),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: ButtonNumberModel(
                            title: "0",
                            onTap: () {
                              onTap("0");
                            },
                          ),
                        ),
                        Expanded(
                          child: ButtonNumberModel(
                            title: ".",
                            onTap: () {
                              onDot(".");
                            },
                          ),
                        ),
                        Expanded(
                          child: ButtonNumberModel(
                            title: "=",
                            onTap: () {
                              onEql();
                            },
                            color: Colors.red,
                          ),
                        ),
                        Expanded(
                          child: ButtonNumberModel(
                            title: "+",
                            onTap: () {
                              onTap("+");
                            },
                            color: const Color(0xff65c6cf),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  onTap(String value) {
    resulteString = "";
    print("eqString $resulteString");
    for (int i = 0; i < op.length; i++) {
      if (outText.isEmpty && value == op[i]) {
        return;
      }
    }

    outText += value;

    for (int i = 0; i < op.length; i++) {
      if (value == op[i]) {
        dotStringCount = 0;
        String textNotEnd = outText.substring(0, outText.length - 1);
        print("textNotEnd $textNotEnd");
//-----------------------------------------------------
//if end string finish  diff two op function replace old op to new op
        for (var e in op) {
          if (e == outText[textNotEnd.length - 1]) {
            String textRemoveReplaceOp =
                textNotEnd.substring(0, outText.length - 2);
            textRemoveReplaceOp += value;
            textNotEnd = textRemoveReplaceOp;
            print("y $textRemoveReplaceOp");
          }
        }
//if end string finish  same two op function  no repeat op
        if (textNotEnd[textNotEnd.length - 1] == outText[outText.length - 1]) {
          outText = textNotEnd;
          print("object");
          print("outTextOP $outText");
        }
      }
    }
    print("outTextxxxx End $outText");
    setState(() {});
  }

  sqr() {
    if (outText.isNotEmpty) {
      onEql();
      double d = double.parse(resulteString);
      outText = "√ (sqr( $d ))";
      d = sqrt(d);
      resulteString = d.toString();
      eqStringOpView = outText;
      outText = "";
      print("object");
    }
  }

  quadrature() {
    if (outText.isNotEmpty) {
      onEql();
      double d = double.parse(resulteString);
      outText = "sqr( $d )";
      d *= d;
      resulteString = d.toString();
      eqStringOpView = outText;
      outText = "";
      print("object");
    }
  }

  onEql() {
    if (outText.isNotEmpty) {
      Parser p = Parser();
      Expression exp = p.parse(outText);
      double eval = exp.evaluate(EvaluationType.REAL, ContextModel());
      print(" eval $eval");
      resulteString = eval.toString();
      eqStringOpView = outText;
      outText = "";

      print("eqStringOpView $eqStringOpView");
      setState(() {});
    }
  }

  onMemory() {
    outText = resulteString;
    setState(() {});
  }

  onDot(String value) {
    String text = '';
    if (dotStringCount < 1) {
      text = outText + value;
      print(text);
    } else {
      return;
    }
    outText = text;

    dotStringCount++;
    setState(() {});
  }

  onTapBackSpace() {
    dotStringCount = 0;
    if (outText.isNotEmpty) {
      int l = outText.length;
      --l;
      outText = outText.substring(0, l);
      setState(() {});
    }
  }

  onTapAC() {
    outText = '';
    resulteString = "";
    eqStringOpView = "";
    dotStringCount = 0;
    setState(() {});
  }
}

import 'package:calc_esay_learn_task6/const_value.dart';
import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

import '../model/button_number_model.dart';
import '../model/number_screen_calc_model.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

/*

لسه = اليساوى و تبديل رمز العمليات وارى بعض

 */
class _HomeScreenState extends State<HomeScreen> {
  String outText = '';
  String clearSign = String.fromCharCode(9003);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff4d4d4d),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              const Expanded(child: SizedBox()),
              eqString==""?
              Expanded(flex: 2, child: NumberScreenCalcModel(outText: outText)):
              Expanded(flex: 2, child: NumberScreenCalcModel(outText: eqString)),
              const SizedBox(height: 30),
              Expanded(
                flex: 8,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: ButtonNumberModel(
                            title: "√",
                            onTap: () {},
                          ),
                        ),
                        Expanded(
                          child: ButtonNumberModel(
                            title: "x²",
                            onTap: () {},
                          ),
                        ),
                        Expanded(
                          child: ButtonNumberModel(
                            title: "±",
                            onTap: () {},
                          ),
                        ),
                        Expanded(
                          child: ButtonNumberModel(
                            title: "%",
                            onTap: () {
                              onTapBackSpace();
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

  List<String> op = ["+", "-", "×", "÷", '.','='];
  int dotStringCount = 0;
  String eqString='';
  onTap(String value) {

    eqString="";
    print("eqString $eqString");
    // print("outTextxxxx Start $outText");
    for (int i = 0; i < op.length; i++) {
      if (outText.isEmpty && value == op[i]) {
        return;
      }
    }

    outText += value;

    for (int i = 0; i < op.length; i++) {
      if (value == op[i]) {
        dotStringCount=0;
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

  onEql(){
   if(outText.isNotEmpty){
     Parser p = Parser();
     Expression exp = p.parse(outText);
     double eval = exp.evaluate(EvaluationType.REAL, ContextModel());
     print(" eval $eval");
     eqString=eval.toString();
     outText="";
     setState(() {
     });
   }
  }
  onDot(String value) {
  String text='';
  if(dotStringCount<1){
    text=outText+value;
    print(text);
  }else{
    return;
  }
outText=text;
  dotStringCount++;
  setState(() { });
  }

  onTapBackSpace() {
    dotStringCount=0;
    if (outText.isNotEmpty) {
      int l = outText.length;
      --l;
      outText = outText.substring(0, l);
      setState(() {});
    }
  }

  onTapAC() {
    outText = '';
    eqString="";
    dotStringCount=0;
    setState(() {});
  }
}

// import 'dart:ffi';

// import 'package:calculator/main.dart';
import 'package:flutter/material.dart';
import 'package:calculator/Essentials/colors.dart' as col;
import 'package:math_expressions/math_expressions.dart';
import 'package:calculator/Pages/UI.dart' as nep;

class calculator extends StatefulWidget {
  const calculator({super.key});

  @override
  State<calculator> createState() => _calculatorState();
}

class _calculatorState extends State<calculator> {
  //variables
  double firstnum = 0.0;
  double secondnum = 0.0;
  var input = '';
  var output = '';
  var operation = '';
  var hideinp = false;
  var outputseze = 30.0;
  var space = 30;

  onBottomClick(value) {
    if (value == 'AC') {
      if (input.isNotEmpty) {
        input = '';
        output = '';
      }
    } else if (value == '<') {
      input = input.substring(0, input.length - 1);
      hideinp = false;
      outputseze = 30;
    } else if (value == 'N') {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) {
            return nep.calculator();
          },
        ),
      );
    } else if (value == '=') {
      if (input.isNotEmpty) {
        var userInput = input;
        userInput = input.replaceAll("x", "*");
        Parser p = Parser();
        Expression expression = p.parse(userInput);
        ContextModel cm = ContextModel();
        var finalvalue = expression.evaluate(EvaluationType.REAL, cm);
        output = finalvalue.toString();
        if (output.endsWith(".0")) {
          output = output.substring(0, output.length - 2);
        }
        input = output;
        hideinp = true;
        outputseze = 45;
      }
    } else {
      input = input + value;
      hideinp = false;
      outputseze = 30;
    }
    setState(
      () {},
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        body: Column(
          children: [
            Container(
              height: 30,
              // margin: EdgeInsets.all(2),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    // " ",
                    "Made with love by GOLUL",
                    style: TextStyle(
                      color: Colors.yellow,
                      fontWeight: FontWeight.w900,
                      fontSize: 17,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Container(
                width: double.infinity,
                color: Colors.transparent,
                padding: EdgeInsets.all(20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      hideinp ? '' : input,
                      style: TextStyle(
                        fontSize: 45,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      output,
                      style: TextStyle(
                        fontSize: outputseze,
                        color: Colors.white.withOpacity(0.7),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                  ],
                ),
              ),
            ),
            Row(
              children: [
                bottom(
                  text: 'AC',
                  btmclr: col.operatorcolor,
                  tcolor: col.orangecolor,
                ),
                bottom(
                  text: '<',
                ),
                Expanded(
                  child: Container(
                    margin: EdgeInsets.all(3),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30)),
                          padding: EdgeInsets.all(22),
                          backgroundColor: Colors.green),
                      onPressed: () => onBottomClick("N"),
                      child: Text(
                        "नेपा",
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 17),
                      ),
                    ),
                  ),
                ),
                bottom(showtext: 'भागा', text: '/', btmclr: col.operatorcolor),
              ],
            ),
            Row(
              children: [
                bottom(
                  text: '7',
                ),
                bottom(text: '8', showtext: '८'),
                bottom(text: '9', showtext: '९'),
                bottom(text: 'x', btmclr: col.operatorcolor),
              ],
            ),
            Row(
              children: [
                bottom(
                  text: '4',
                ),
                bottom(
                  text: '5',
                ),
                bottom(
                  text: '6',
                ),
                bottom(text: '-', btmclr: col.operatorcolor),
              ],
            ),
            Row(
              children: [
                bottom(
                  text: '1',
                ),
                bottom(
                  text: '2',
                ),
                bottom(
                  text: '3',
                ),
                bottom(text: '+', btmclr: col.operatorcolor),
              ],
            ),
            Row(
              children: [
                bottom(
                  text: '%',
                ),
                bottom(
                  text: '0',
                ),
                bottom(
                  text: '.',
                ),
                bottom(text: '=', btmclr: col.orangecolor),
              ],
            ),
            Container(
              // margin: EdgeInsets.all(2),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Made with 💓 by",
                    style: TextStyle(
                      color: Colors.red,
                      fontWeight: FontWeight.w900,
                      fontSize: 20,
                    ),
                  ),
                  Text(
                    " Gokul Subedi",
                    style: TextStyle(
                      color: Colors.green,
                      fontWeight: FontWeight.w900,
                      fontSize: 20,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget bottom({
    showtext = '',
    text,
    tcolor = Colors.white,
    btmclr = col.butomcolor,
  }) {
    return Expanded(
      child: Container(
        margin: EdgeInsets.all(3),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30)),
              padding: EdgeInsets.all(23),
              backgroundColor: btmclr),
          onPressed: () => onBottomClick(text),
          child: Text(
            text,
            style: TextStyle(
                color: tcolor, fontWeight: FontWeight.bold, fontSize: 17),
          ),
        ),
      ),
    );
  }
}

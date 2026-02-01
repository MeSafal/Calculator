// import 'dart:ffi';

// import 'package:calculator/main.dart';
import 'package:flutter/material.dart';
import 'package:calculator/Essentials/colors.dart' as col;
import 'package:math_expressions/math_expressions.dart';
import 'package:calculator/pages/english.dart' as eng;

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
  var showinp = '';
  var showop = '';
  var output = '';
  var operation = '';
  var hideinp = false;
  var outputseze = 30.0;
  var space = 20;
  var tempout = '';
  var tempinp = '';

  onBottomClick(nepali, value) {
    if (value == 'AC') {
      if (input.isNotEmpty) {
        input = '';
        output = '';
        showinp = '';
        showop = '';
      }
    } else if (value == '<') {
      input = input.substring(0, input.length - 1);
      showinp = showinp.substring(0, showinp.length - 1);
      hideinp = false;
      outputseze = 30;
    } else if (value == 'N') {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) {
            return eng.calculator();
          },
        ),
      );
    } else if (value == '=') {
      if (input.isNotEmpty) {
        var userInput = input;
        userInput = input.replaceAll("X", "*");
        showinp = showinp.replaceAll("भागा", "/");
        Parser p = Parser();
        Expression expression = p.parse(userInput);
        ContextModel cm = ContextModel();
        var finalvalue = expression.evaluate(EvaluationType.REAL, cm);
        output = finalvalue.toString();
        showop = output;
        showop = showop.replaceAll("1", "१");
        showop = showop.replaceAll("2", "२");
        showop = showop.replaceAll("3", "३");
        showop = showop.replaceAll("4", "४");
        showop = showop.replaceAll("5", "५");
        showop = showop.replaceAll("6", "६");
        showop = showop.replaceAll("7", "७");
        showop = showop.replaceAll("8", "८");
        showop = showop.replaceAll("9", "९");
        showop = showop.replaceAll("0", "०");

        if (output.endsWith(".0")) {
          output = output.substring(0, output.length - 2);
          showop = showop.substring(0, showop.length - 2);
        }
        input = output;
        showinp = showop;
        hideinp = true;
        outputseze = 45;
      }
    } else {
      input = input + value;
      showinp = showinp + nepali;
      showinp = showinp.replaceAll("भागा", "/");
      showinp = showinp.replaceAll("जोड", "+");
      showinp = showinp.replaceAll("घट", "-");
      showinp = showinp.replaceAll("गुणा", "x");
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
                    "Made with Love by GOKUL",
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
                      hideinp ? '' : showinp,
                      style: TextStyle(
                        fontSize: 45,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      showop,
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
                  showtext: 'ए.सी.',
                  btmclr: col.operatorcolor,
                  tcolor: col.orangecolor,
                ),
                bottom(
                  text: '<',
                  showtext: 'मेट',
                ),
                Expanded(
                  child: Container(
                    margin: EdgeInsets.all(3),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                          padding: EdgeInsets.all(25),
                          backgroundColor: Colors.green),
                      onPressed: () => onBottomClick("N", "N"),
                      child: Text(
                        "अङ्रे",
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
                  showtext: '७',
                  text: '7',
                ),
                bottom(text: '8', showtext: '८'),
                bottom(text: '9', showtext: '९'),
                bottom(showtext: 'गुणा', text: 'X', btmclr: col.operatorcolor),
              ],
            ),
            Row(
              children: [
                bottom(
                  showtext: '४',
                  text: '4',
                ),
                bottom(
                  showtext: '५',
                  text: '5',
                ),
                bottom(
                  showtext: '६',
                  text: '6',
                ),
                bottom(showtext: 'घट', text: '-', btmclr: col.operatorcolor),
              ],
            ),
            Row(
              children: [
                bottom(
                  showtext: '१',
                  text: '1',
                ),
                bottom(
                  showtext: '२',
                  text: '2',
                ),
                bottom(
                  showtext: '३',
                  text: '3',
                ),
                bottom(showtext: 'जोड', text: '+', btmclr: col.operatorcolor),
              ],
            ),
            Row(
              children: [
                bottom(text: '%', showtext: "%"),
                bottom(
                  showtext: '०',
                  text: '0',
                ),
                bottom(
                  text: '.',
                  showtext: '.',
                ),
                bottom(showtext: '=', text: '=', btmclr: col.orangecolor),
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
          onPressed: () => onBottomClick(showtext, text),
          child: Text(
            showtext,
            style: TextStyle(
                color: tcolor, fontWeight: FontWeight.bold, fontSize: 17),
          ),
        ),
      ),
    );
  }
}

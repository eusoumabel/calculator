import 'package:calculator_final/Widgets/button.dart';
import 'package:calculator_final/view/HomeView/home.view.styles.dart';
import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

HomeViewStyles hvs = new HomeViewStyles();

class HomeView extends StatefulWidget {
  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  var userQuestion = '';
  var userAnswer = '';

  final List<String> buttons = [
    "C",
    "DEL",
    "%",
    "/",
    "9",
    "8",
    "7",
    "x",
    "6",
    "5",
    "4",
    "-",
    "3",
    "2",
    "1",
    "+",
    "0",
    ",",
    "ANS",
    "="
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: hvs.backgroundColor,
      body: Column(
        children: [
          Expanded(
            child: Stack(
              children: [
                hvs.resultBackground(),
                Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      SizedBox(
                        height: 50,
                      ),
                      Container(
                        padding: EdgeInsets.all(20),
                        alignment: Alignment.centerLeft,
                        child: Text(
                          userQuestion,
                          style: TextStyle(
                            color: Color.fromRGBO(0, 96, 100, 1),
                            fontSize: 20,
                          ),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.all(20),
                        alignment: Alignment.centerRight,
                        child: Text(
                          userAnswer,
                          style: TextStyle(
                            color: Color.fromRGBO(0, 96, 100, 1),
                            fontSize: 60,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            flex: 2,
            child: Container(
              color: Colors.white,
              child: GridView.builder(
                itemCount: buttons.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 4,
                ),
                itemBuilder: (BuildContext context, int index) {
                  ///Clear Button
                  if (index == 0) {
                    return Button(
                      buttonTapped: () {
                        setState(() {
                          userQuestion = '';
                          userAnswer = '';
                        });
                      },
                      buttonText: buttons[index],
                      color: Color.fromRGBO(51, 128, 132, 1),
                      textColor: Colors.white,
                      radius: 50,
                      fontSize: 30,
                    );
                  }

                  ///Delete Button
                  else if (index == 1) {
                    return Button(
                      buttonTapped: () {
                        setState(() {
                          userQuestion = userQuestion.substring(
                              0, userQuestion.length - 1);
                        });
                      },
                      buttonText: buttons[index],
                      color: Color.fromRGBO(51, 128, 132, 1),
                      textColor: Colors.white,
                      radius: 50,
                      fontSize: 30,
                    );
                  }

                  ///Answer Button
                  else if (index == 18) {
                    return Button(
                      buttonTapped: () {
                        setState(() {
                          equalPressed();
                        });
                      },
                      buttonText: buttons[index],
                      color: Color.fromRGBO(51, 128, 132, 1),
                      textColor: Colors.white,
                      radius: 50,
                      fontSize: 30,
                    );
                  }

                  ///Equal Button
                  else if (index == buttons.length - 1) {
                    return Button(
                      buttonTapped: () {
                        setState(() {
                          equalPressed();
                        });
                      },
                      buttonText: buttons[index],
                      color: Color.fromRGBO(0, 96, 100, 1),
                      textColor: Colors.white,
                      radius: 50,
                      fontSize: 30,
                    );
                  }

                  ///Other Buttons
                  else {
                    return Button(
                      buttonTapped: () {
                        setState(() {
                          userQuestion += buttons[index];
                        });
                      },
                      buttonText: buttons[index],
                      color: isOperator(buttons[index])
                          ? Color.fromRGBO(0, 96, 100, 1)
                          : Color.fromRGBO(87, 161, 165, 1),
                      textColor: Colors.white,
                      radius: isOperator(buttons[index]) ? 50 : 30,
                      fontSize: isOperator(buttons[index]) ? 40 : 30,
                    );
                  }
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  bool isOperator(String x) {
    if (x == "%" || x == "/" || x == "x" || x == "-" || x == "+" || x == "=") {
      return true;
    }
    return false;
  }

  void equalPressed() {
    String finalQuestion = userQuestion;
    finalQuestion = finalQuestion.replaceAll('x', '*');

    Parser p = Parser();
    Expression exp = p.parse(finalQuestion);
    ContextModel cm = ContextModel();
    double eval = exp.evaluate(EvaluationType.REAL, cm);

    userAnswer = eval.toString();
  }
}

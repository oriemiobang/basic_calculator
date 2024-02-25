// ignore_for_file: prefer_const_constructors

import 'package:basic_calculator/clases/history.dart';
import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

class Body extends StatefulWidget {
  const Body({super.key});

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  List<Map<String, dynamic>> itemList = [
    {
      'color': Colors.red,
      'darkFg-color': Colors.red,
      'item': 'C',
      'background-color': Colors.white,
      'darkBg-color': const Color.fromARGB(255, 37, 37, 37),
    },
    {
      'color': Colors.green,
      'item': '()',
      'darkFg-color': Colors.green,
      'background-color': Colors.white,
      'darkBg-color': const Color.fromARGB(255, 37, 37, 37),
    },
    {
      'color': Colors.green,
      'item': '%',
      'darkFg-color': Colors.green,
      'background-color': Colors.white,
      'darkBg-color': const Color.fromARGB(255, 37, 37, 37),
    },
    {
      'color': Colors.green,
      'item': '/',
      'darkFg-color': Colors.green,
      'background-color': Colors.white,
      'darkBg-color': const Color.fromARGB(255, 37, 37, 37),
    },
    {
      'color': Colors.black,
      'item': '7',
      'darkFg-color': Colors.white,
      'background-color': Colors.white,
      'darkBg-color': const Color.fromARGB(255, 37, 37, 37)
    },
    {
      'color': Colors.black,
      'item': '8',
      'darkFg-color': Colors.white,
      'background-color': Colors.white,
      'darkBg-color': const Color.fromARGB(255, 37, 37, 37)
    },
    {
      'color': Colors.black,
      'item': '9',
      'darkFg-color': Colors.white,
      'background-color': Colors.white,
      'darkBg-color': const Color.fromARGB(255, 37, 37, 37)
    },
    {
      'color': Colors.green,
      'item': 'x',
      'darkFg-color': Colors.green,
      'background-color': Colors.white,
      'darkBg-color': const Color.fromARGB(255, 37, 37, 37),
    },
    {
      'color': Colors.black,
      'item': '4',
      'darkFg-color': Colors.white,
      'background-color': Colors.white,
      'darkBg-color': const Color.fromARGB(255, 37, 37, 37)
    },
    {
      'color': Colors.black,
      'item': '5',
      'darkFg-color': Colors.white,
      'background-color': Colors.white,
      'darkBg-color': const Color.fromARGB(255, 37, 37, 37)
    },
    {
      'color': Colors.black,
      'item': '6',
      'background-color': Colors.white,
      'darkFg-color': Colors.white,
      'darkBg-color': const Color.fromARGB(255, 37, 37, 37)
    },
    {
      'color': Colors.green,
      'item': '-',
      'darkFg-color': Colors.green,
      'background-color': Colors.white,
      'darkBg-color': const Color.fromARGB(255, 37, 37, 37),
    },
    {
      'color': Colors.black,
      'item': '1',
      'darkFg-color': Colors.white,
      'background-color': Colors.white,
      'darkBg-color': const Color.fromARGB(255, 37, 37, 37)
    },
    {
      'color': Colors.black,
      'item': '2',
      'darkFg-color': Colors.white,
      'background-color': Colors.white,
      'darkBg-color': const Color.fromARGB(255, 37, 37, 37)
    },
    {
      'color': Colors.black,
      'item': '3',
      'darkFg-color': Colors.white,
      'background-color': Colors.white,
      'darkBg-color': const Color.fromARGB(255, 37, 37, 37)
    },
    {
      'color': Colors.green,
      'darkFg-color': Colors.green,
      'item': '+',
      'background-color': Colors.white,
      'darkBg-color': const Color.fromARGB(255, 37, 37, 37)
    },
    {
      'color': Colors.black,
      'darkFg-color': Colors.white,
      'item': '.',
      'background-color': Colors.white,
      'darkBg-color': const Color.fromARGB(255, 37, 37, 37)
    },
    {
      'color': Colors.black,
      'item': '0',
      'darkFg-color': Colors.white,
      'background-color': Colors.white,
      'darkBg-color': const Color.fromARGB(255, 37, 37, 37)
    },
    {
      'color': Colors.black,
      'darkFg-color': Colors.white,
      'item': '>', // 18
      'background-color': Colors.white,
      'darkBg-color': const Color.fromARGB(255, 37, 37, 37)
    },
    {
      'color': Colors.white,
      'darkFg-color': Colors.white,
      'item': '=',
      'background-color': Colors.green,
      'darkBg-color': Colors.green,
    },
  ];

  String input = '';
  String output = '';
  bool isClosed = false;
  // int counter = 0;

  calculate(value, index) {
    try {
      print(value);
      if (value == 'C') {
        input = '';
        output = '';
      } else if (value == '%') {
        if (input.isNotEmpty) {
          var userInut = input;
          var tempoInput = input;
          tempoInput += '%';
          userInut = input.replaceAll('x', '*');
          Parser p = Parser();
          Expression exp = p.parse(userInut);
          ContextModel contextModel = ContextModel();
          var finalValue = exp.evaluate(EvaluationType.REAL, contextModel);
          output = (finalValue / 100).toString();
          // output = finalValue.toString();
          if (output.endsWith('.0')) {
            output = output.substring(0, output.length - 2);
          }

          SQLHelper.createItem(tempoInput, output);
        }
      } else if (value == '>') {
        if (input.isNotEmpty) input = input.substring(0, input.length - 1);
      } else if (value == '=') {
        if (input.isNotEmpty) {
          var userInut = input;
          userInut = input.replaceAll('x', '*');
          Parser p = Parser();
          Expression exp = p.parse(userInut);
          ContextModel contextModel = ContextModel();
          var finalValue = exp.evaluate(EvaluationType.REAL, contextModel);
          output = finalValue.toString();
          if (output.endsWith('.0')) {
            output = output.substring(0, output.length - 2);
          }
          SQLHelper.createItem(input, output);
        }

        input = output;
      } else {
        input += value;
      }

      setState(() {});
      //
      // switch(value){
      //   case
      // }
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    Brightness currentTheme = Theme.of(context).brightness;
    return Container(
      // color: Colors.white,
      height: double.maxFinite,
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            Container(
              width: double.infinity,
              height: 180,
              color: Colors.transparent,
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      input,
                      style: TextStyle(fontSize: 35),
                    ),
                    Expanded(
                      child: Text(
                        output,
                        style: TextStyle(fontSize: 45),
                      ),
                    )
                  ]),
            ),
            Divider(),
            SizedBox(
              height: 20,
            ),
            Expanded(
                child: GridView.builder(
                    itemCount: itemList.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 4,
                        mainAxisSpacing: 10,
                        crossAxisSpacing: 10),
                    itemBuilder: (BuildContext context, index) {
                      return Container(
                        decoration: BoxDecoration(
                            // boxShadow: [
                            //   BoxShadow(
                            //     color: Colors.grey,
                            //     offset: Offset(1, 1),
                            //   )
                            // ],
                            color: currentTheme == Brightness.dark
                                ? itemList[index]['darkBg-color']
                                : itemList[index]['background-color'],
                            borderRadius: BorderRadius.circular(30)),
                        height: 28,
                        width: 28,
                        child: TextButton(
                          style: TextButton.styleFrom(
                              foregroundColor: currentTheme == Brightness.dark
                                  ? itemList[index]['darkFg-color']
                                  : itemList[index]['color']),
                          onPressed: () {
                            if (index == 1) {
                              isClosed
                                  ? itemList[index]['item'] = ')'
                                  : itemList[index]['item'] = '(';
                              setState(() {
                                isClosed = !isClosed;
                                // counter = 0;
                              });
                            }
                            calculate(itemList[index]['item'], index);
                          },
                          child: Container(
                              // height: 20,
                              // width: 20,

                              child: index == 18
                                  ? Center(
                                      child: Icon(Icons.backspace_outlined),
                                    )
                                  : Center(
                                      child: Text(
                                      index == 1
                                          ? '()'
                                          : itemList[index]['item'],
                                      style: index == 16
                                          ? TextStyle(
                                              color: currentTheme ==
                                                      Brightness.dark
                                                  ? Colors.white
                                                  : Colors.black,
                                              fontSize: 50,
                                              // fontWeight: FontWeight.bold
                                            )
                                          : TextStyle(
                                              fontSize: 30,
                                              fontWeight: FontWeight.bold),
                                    ))),
                        ),
                      );
                    }))
          ],
        ),
      ),
    );
  }
}

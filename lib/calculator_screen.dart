import 'package:calculator/color_button.dart';
import 'package:calculator/counter_bloc.dart';
import 'package:calculator/button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'calculator_state.dart';

class CalculatorScreen extends StatelessWidget {
  const CalculatorScreen({super.key});

  @override
  Widget build(BuildContext context) {
    bool isDarkMode = Theme.of(context).brightness == Brightness.dark;
    return Scaffold(
        body: Padding(
      padding: EdgeInsets.all(MediaQuery.of(context).size.width * 0.05),
      child: Column(
        children: [
          BlocBuilder<CalculatorCubit, CalculatorState>(
            builder: (context, state) {
              return SizedBox(
                width: double.infinity,
                height: MediaQuery.of(context).size.height * 0.4,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    RichText(
                      text: TextSpan(
                        children: [
                          for (var char in state.currentInput.split(''))
                            TextSpan(
                              text: char,
                              style: TextStyle(
                                  color: RegExp(r'[0-9.]').hasMatch(char)
                                      ? const Color(0xFF818181)
                                      : const Color(0xFF109DFF),
                                  fontSize: MediaQuery.of(context).size.width * 0.06),
                            ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.05,
                    ),
                    Text(state.result,
                        style: TextStyle(
                            fontSize: 35,
                            color: isDarkMode ? Colors.white : Colors.black)),
                  ],
                ),
              );
            },
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Row(
                children: [
                  RectangleButton(
                    btnText: "sqrt",
                    btnType: 'small_rectangle',
                    backgroundColor: isDarkMode ? darkColor[0] : lightColor[0],
                    foregroundColor: isDarkMode ? darkColor[1] : lightColor[1],
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.05,
                  ),
                  RectangleButton(
                    btnText: "sin",
                    btnType: 'small_rectangle',
                    backgroundColor: isDarkMode ? darkColor[0] : lightColor[0],
                    foregroundColor: isDarkMode ? darkColor[1] : lightColor[1],
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.05,
                  ),
                  RectangleButton(
                    btnText: "(",
                    btnType: 'small_rectangle',
                    backgroundColor: isDarkMode ? darkColor[0] : lightColor[0],
                    foregroundColor: isDarkMode ? darkColor[1] : lightColor[1],
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.05,
                  ),
                  RectangleButton(
                    btnText: ")",
                    btnType: 'small_rectangle',
                    backgroundColor: isDarkMode ? darkColor[0] : lightColor[0],
                    foregroundColor: isDarkMode ? darkColor[1] : lightColor[1],
                  ),
                ],
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.025,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  // Line 2
                  RectangleButton(
                    btnText: "AC",
                    btnType: 'rectangle',
                    backgroundColor: isDarkMode ? darkColor[2] : lightColor[0],
                    foregroundColor: isDarkMode ? darkColor[3] : lightColor[2],
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.05,
                  ),
                  RectangleButton(
                    btnText: "x",
                    btnType: 'rectangle',
                    backgroundColor: isDarkMode ? darkColor[2] : lightColor[0],
                    foregroundColor: isDarkMode ? darkColor[3] : lightColor[2],
                    isIconBtn: true,
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.05,
                  ),
                  RectangleButton(
                    btnText: "/",
                    btnType: 'rectangle',
                    backgroundColor: isDarkMode ? darkColor[4] : lightColor[3],
                    foregroundColor: isDarkMode ? darkColor[5] : lightColor[4],
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.05,
                  ),
                  RectangleButton(
                    btnText: "*",
                    btnType: 'rectangle',
                    backgroundColor: isDarkMode ? darkColor[4] : lightColor[3],
                    foregroundColor: isDarkMode ? darkColor[5] : lightColor[4],
                  ),
                ],
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.025,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  // Line 3
                  RectangleButton(
                    btnText: "7",
                    btnType: 'rectangle',
                    backgroundColor: isDarkMode ? darkColor[0] : lightColor[0],
                    foregroundColor: isDarkMode ? darkColor[1] : lightColor[5],
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.05,
                  ),
                  RectangleButton(
                    btnText: "8",
                    btnType: 'rectangle',
                    backgroundColor: isDarkMode ? darkColor[0] : lightColor[0],
                    foregroundColor: isDarkMode ? darkColor[1] : lightColor[5],
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.05,
                  ),
                  RectangleButton(
                    btnText: "9",
                    btnType: 'rectangle',
                    backgroundColor: isDarkMode ? darkColor[0] : lightColor[0],
                    foregroundColor: isDarkMode ? darkColor[1] : lightColor[5],
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.05,
                  ),
                  RectangleButton(
                    btnText: "-",
                    btnType: 'rectangle',
                    backgroundColor: isDarkMode ? darkColor[4] : lightColor[3],
                    foregroundColor: isDarkMode ? darkColor[5] : lightColor[4],
                  ),
                ],
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.025,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  // Line 4
                  RectangleButton(
                    btnText: "4",
                    btnType: 'rectangle',
                    backgroundColor: isDarkMode ? darkColor[0] : lightColor[0],
                    foregroundColor: isDarkMode ? darkColor[1] : lightColor[5],
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.05,
                  ),
                  RectangleButton(
                    btnText: "5",
                    btnType: 'rectangle',
                    backgroundColor: isDarkMode ? darkColor[0] : lightColor[0],
                    foregroundColor: isDarkMode ? darkColor[1] : lightColor[5],
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.05,
                  ),
                  RectangleButton(
                    btnText: "6",
                    btnType: 'rectangle',
                    backgroundColor: isDarkMode ? darkColor[0] : lightColor[0],
                    foregroundColor: isDarkMode ? darkColor[1] : lightColor[5],
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.05,
                  ),
                  RectangleButton(
                    btnText: "+",
                    btnType: 'rectangle',
                    backgroundColor: isDarkMode ? darkColor[4] : lightColor[3],
                    foregroundColor: isDarkMode ? darkColor[5] : lightColor[4],
                  ),
                ],
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.025,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    children: [
                      RectangleButton(
                        btnText: "1",
                        btnType: 'rectangle',
                        backgroundColor: isDarkMode ? darkColor[0] : lightColor[0],
                        foregroundColor: isDarkMode ? darkColor[1] : lightColor[5],
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.025,
                      ),
                      RectangleButton(
                        btnText: "0",
                        btnType: 'rectangle',
                        backgroundColor: isDarkMode ? darkColor[0] : lightColor[0],
                        foregroundColor: isDarkMode ? darkColor[1] : lightColor[5],
                      ),
                    ],
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.06,
                  ),
                  Column(
                    children: [
                      RectangleButton(
                        btnText: "2",
                        btnType: 'rectangle',
                        backgroundColor: isDarkMode ? darkColor[0] : lightColor[0],
                        foregroundColor: isDarkMode ? darkColor[1] : lightColor[5],
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.025,
                      ),
                      RectangleButton(
                        btnText: ".",
                        btnType: 'rectangle',
                        backgroundColor: isDarkMode ? darkColor[0] : lightColor[0],
                        foregroundColor: isDarkMode ? darkColor[1] : lightColor[5],
                      ),
                    ],
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.06,
                  ),
                  Column(
                    children: [
                      RectangleButton(
                        btnText: "3",
                        btnType: 'rectangle',
                        backgroundColor: isDarkMode ? darkColor[0] : lightColor[0],
                        foregroundColor: isDarkMode ? darkColor[1] : lightColor[5],
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.025,
                      ),
                      RectangleButton(
                        btnText: "%",
                        btnType: 'rectangle',
                        backgroundColor: isDarkMode ? darkColor[0] : lightColor[0],
                        foregroundColor: isDarkMode ? darkColor[1] : lightColor[5],
                      ),
                    ],
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.06,
                  ),
                  Column(
                    children: [
                      RectangleButton(
                        btnText: "=",
                        btnType: 'height_rectangle',
                        backgroundColor: isDarkMode ? darkColor[6] : lightColor[6],
                        foregroundColor: isDarkMode ? darkColor[7] : lightColor[7],
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    ));
  }
}

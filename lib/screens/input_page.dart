import 'package:flutter/material.dart';
//import 'package:bmicalci/components//my_icon.dart';
import 'package:bmicalci/components//my_reusecard.dart';
//import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../constants.dart';
import 'result_page.dart';
import '../components/bottom_bar.dart';
//import '../components/round_icon_button.dart';
import 'package:bmicalci/calculator_brain.dart';

enum Gender {
  male,
  female,
}

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender type;
  int height = 180;
  int weight = 65;
  int age = 24;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'BMI CALCULATOR',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
            fontSize: 25.0,
          ),
        ),
      ),

      // Body part
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            child: Row(
              children: <Widget>[
                // First row.
                Expanded(
                  child: MyReuseCard(
                    // MyReuseCard has three parameters.
                    onPress: () {
                      setState(
                        () {
                          type = Gender.male;
                        },
                      );
                    },
                    colour: type == Gender.male ? kActiveColor : kInactiveColor,
                    // cardChild: IconContent(
                    //     icon: FontAwesomeIcons.mars, label: 'MALE  '),
                  ),
                ),
                Expanded(
                  child: MyReuseCard(
                    onPress: () {
                      setState(
                        () {
                          type = Gender.female;
                        },
                      );
                    },
                    colour:
                        type == Gender.female ? kActiveColor : kInactiveColor,
                    // cardChild: IconContent(
                    //     icon: FontAwesomeIcons.venus, label: 'FEMALE '),
                  ),
                ),
              ],
            ),
          ),

          // Second Row.
          Expanded(
            child: MyReuseCard(
              colour: kInactiveColor,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'Height',
                    style: kLabelTextStyle,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: <Widget>[
                      Text(
                        height.toString(),
                        style: kNumberTextStyle,
                      ),
                      Text(
                        'cm',
                        style: kLabelTextStyle,
                      ),
                    ],
                  ),
                  SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                        thumbColor: Colors.red,
                        activeTrackColor: Colors.white,
                        overlayColor: Colors.white70,
                        thumbShape:
                            RoundSliderThumbShape(enabledThumbRadius: 15.0),
                        overlayShape:
                            RoundSliderOverlayShape(overlayRadius: 30.0)),
                    child: Slider(
                      value: height.toDouble(),
                      min: 120.0,
                      max: 220.0,
                      inactiveColor: Colors.blueGrey,
                      onChanged: (double newHeight) {
                        setState(() {
                          height = newHeight.round();
                        });
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),

          // Third row.
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: MyReuseCard(
                    colour: kInactiveColor,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'Weight',
                          style: kLabelTextStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.baseline,
                          textBaseline: TextBaseline.alphabetic,
                          children: <Widget>[
                            Text(
                              weight.toString(),
                              style: kNumberTextStyle,
                            ),
                            Text(
                              'kg',
                              style: kLabelTextStyle,
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            // RoundIconButton(
                            //   icon: FontAwesomeIcons.minus,
                            //   onPress: () {
                            //     setState(() {
                            //       weight--;
                            //     });
                            //   },
                            // ),
                            SizedBox(
                              width: 10.0,
                            ),
                            // RoundIconButton(
                            //   icon: FontAwesomeIcons.plus,
                            //   onPress: () {
                            //     setState(() {
                            //       weight++;
                            //     });
                            //   },
                            // ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: MyReuseCard(
                    colour: kInactiveColor,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'Age',
                          style: kLabelTextStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.baseline,
                          textBaseline: TextBaseline.alphabetic,
                          children: <Widget>[
                            Text(
                              age.toString(),
                              style: kNumberTextStyle,
                            ),
                            Text(
                              'yrs',
                              style: kLabelTextStyle,
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            // RoundIconButton(
                            //   icon: FontAwesomeIcons.minus,
                            //   onPress: () {
                            //     setState(() {
                            //       age--;
                            //     });
                            //   },
                            // ),
                            SizedBox(
                              width: 10.0,
                            ),
                            // RoundIconButton(
                            //   icon: FontAwesomeIcons.plus,
                            //   onPress: () {
                            //     setState(() {
                            //       age++;
                            //     });
                            //   },
                            // ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),

          // Bottom part
          BottomBar(
            onTap: () {
              CalculatorBrain calc =
                  CalculatorBrain(height: height, weight: weight);

              if (type == Gender.male) {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ResultPage(
                      bmiResult: calc.calculateBMI(),
                      resultText: calc.mGetResult(),
                      interpretation: calc.mGetInterpretation(),
                    ),
                  ),
                );
              } else if (type == Gender.female) {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ResultPage(
                      bmiResult: calc.calculateBMI(),
                      resultText: calc.fGetResult(),
                      interpretation: calc.fGetInterpretation(),
                    ),
                  ),
                );
              }
            },
            bottomTitle: 'CALCULATE',
          ),
        ],
      ),
    );
  }
}

//if(type == Gender.male) {
//MaleCalculatorBrain calc =
//MaleCalculatorBrain(height: height, weight: weight);
//}
//else if(type == Gender.female){
//FemaleCalculatorBrain calc =
//FemaleCalculatorBrain(height: height, weight: weight);
//}

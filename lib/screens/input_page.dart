import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:bmi_calculator/components/icon_content.dart';
import 'package:bmi_calculator/components/reusable_card.dart';
import 'package:bmi_calculator/constants.dart';
import 'package:bmi_calculator/screens/result_page.dart';
import 'package:bmi_calculator/components/button_button.dart';
import 'package:bmi_calculator/components/round_icon_button.dart';
import 'package:bmi_calculator/calculator_brain.dart';


enum Gender{
  female,
  male
}


class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}



class _InputPageState extends State<InputPage> {

  Gender selectedgender;
  int height=180;
  int weight=60;
  int age=20;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        //to stretch the card across the whole page
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
              child: Row(
                  children: <Widget>[
                       Expanded(
                         child:ReusableCard(
                           onPress: (){
                             setState(() {
                               selectedgender=Gender.male;
                             });
                           },
                             colour:selectedgender==Gender.male?kactivecartColor:kinactiveCardcolor,
                              cardChild: IconContent(icon: FontAwesomeIcons.mars, label:'MALE',),
                        ),
                       ),
                        Expanded(
                              child: ReusableCard(
                                //function
                                onPress: (){
                                  //to change the property when it gets rendered
                                  setState(() {
                                    //Gender property
                                    selectedgender=Gender.female;
                                  });
                                },
                                  colour:selectedgender==Gender.female?kactivecartColor:kinactiveCardcolor,
                                cardChild: IconContent(
                                  icon:FontAwesomeIcons.venus,
                                  label:'FEMALE',
                                ),
                              ),
                      ),

                  ],
              )
          ),
              Expanded(
                child: ReusableCard(
                  colour:kactivecartColor,
                  cardChild: Column(
                    //to take it to center
                    mainAxisAlignment: MainAxisAlignment.center,

                    children: <Widget>[
                      Text(
                        'HEIGHT',
                        style:klabelTextStyle,
                      ),
                      Row(
                        //to take it to center
                        mainAxisAlignment: MainAxisAlignment.center,
                        //to match the baseline with the text
                        crossAxisAlignment: CrossAxisAlignment.baseline,
                        //we have to mention where the axis starts
                        textBaseline: TextBaseline.alphabetic,
                        children: <Widget>[
                          Text(
                            height.toString(),
                            //constant defined in constants.dart
                            style: kstyle,
                          ),
                          Text(
                            'cm',
                            style: klabelTextStyle,
                          )
                          ],
                        ),
                          SliderTheme(
                            //to change the slider apperance//context is used from buildcontext which will show the current state of the app
                            data:SliderTheme.of(context).copyWith(
                              activeTrackColor: Colors.white,
                              inactiveTrackColor : Color(0xFF8D8E98),
                                          thumbColor: Colors.pink,
                                          overlayColor: Color(0x29EB1555),
                                          //overlayColor: Colors.pink,
                                          thumbShape: RoundSliderThumbShape(enabledThumbRadius: 15.0),
                                          overlayShape: RoundSliderOverlayShape(overlayRadius:30.0),

                            ),
                            child: Slider(
                                value:height.toDouble(),
                                min:120.0,
                                max:220.0,
                              //left side color

                              onChanged: (double newValue) {
                                setState(() {
                                  height = newValue.round();
                                });
                              },

                            ),
                          ),
                        ],
                        ),
                        ),
                        ),


              Expanded(
                  child: Row(

                      children: <Widget>[
                      Expanded(
                        child:ReusableCard(
                            colour:kactivecartColor,
                          cardChild: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Text(
                                  'WEIGHT',
                                style: klabelTextStyle,

                              ),
                              Text(
                                weight.toString(),
                                style:kstyle,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  RoundIconButton(
                                      icon: FontAwesomeIcons.minus,
                                      onPressed: () {
                                        setState(() {
                                          weight--;
                                        });
                                      }),
                                  SizedBox(width:10.0 ,),
                                  RoundIconButton(
                                    icon: FontAwesomeIcons.plus,
                                    onPressed: () {
                                      setState(() {
                                        weight++;
                                      });
                                    },
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                      Expanded(
                        child:ReusableCard(
                            colour:kactivecartColor,
                          cardChild: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Text(
                                'AGE',
                                style: klabelTextStyle,

                              ),
                              Text(
                                age.toString(),
                                style:kstyle,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  RoundIconButton(
                                    icon: FontAwesomeIcons.minus,
                                    onPressed: () {
                                      setState(
                                            () {
                                          age--;
                                        },
                                      );
                                    },
                                  ),
                                  SizedBox(width:10.0,),
                                  RoundIconButton(
                                      icon: FontAwesomeIcons.plus,
                                      onPressed: () {
                                        setState(() {
                                          age++;
                                        });
                                      })
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                      ],
                  ),
              ),

          BottomButton(
            buttomTitle: 'CALCULATE',
            onTap: () {
              CalculatorBrain calc =
              CalculatorBrain(height: height, weight: weight);

              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ResultsPage(
              bmiResult:calc.calculateBmi() ,
              interpretation: calc.getInterpretation(),
              resultText: calc.getResult(),
            ),
            ),
            );
          },
          ),
        ],

    ),

    );
  }
}


//new stateless widget is created
//we have created our own button

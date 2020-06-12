import 'package:flutter/material.dart';
import 'package:bmi_calculator/constants.dart';
import 'package:bmi_calculator/components/reusable_card.dart';
import 'package:bmi_calculator/components/button_button.dart';



class ResultsPage extends StatelessWidget {
  ResultsPage({@required this.bmiResult, @required this.resultText,@required this.interpretation});

  final String bmiResult;
  final String resultText;
  final String interpretation;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        title:Text('BMI CALCULATOR'),
      ),
      body:Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            child: Container(
              padding: EdgeInsets.all(15.0),
              alignment: Alignment.bottomLeft,
              child:Text(
                'Your result',
                  style: kTitleTextStyle,
              ),
            ),
          ),
          Expanded(
            //to increase the size of the container
            flex:5,
            child:ReusableCard(
                colour:kactivecartColor,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text(
                    //will change all the things to upper case
                   resultText.toUpperCase(),
                    style: kResultTextStyle,
                  ),
                  Text(
                    bmiResult,
                    style:BmiTextStyle,
                  ),
                  Text(
                    interpretation,
                    style:kBodyTextStyle,
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          ),
          BottomButton(buttomTitle: 'RE-CALCULATE',
          onTap:(){
            Navigator.pop(context);
          },
          )
        ],
      ),
      );

  }
}
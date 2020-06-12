import 'package:flutter/material.dart';
import 'package:bmi_calculator/constants.dart';


class BottomButton extends StatelessWidget {
  BottomButton({@required this.onTap, @required this.buttomTitle});
  final Function onTap;
  final String buttomTitle;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        child:Center(
          child: Text(
            buttomTitle,
            style:kLargeButtonTextStyle ,
          ),
        ),
        color:kbottomcatColor,
        margin:EdgeInsets.only(top:10.0),
        padding:EdgeInsets.only(bottom:20.0),
        width:double.infinity,
        height: kbottomContainerHeight,
      ),
    );
  }
}
import 'package:flutter/material.dart';


class ReusableCard extends StatelessWidget {
  //constructor
  ReusableCard({@required this.colour,this.cardChild,this.onPress});
  //property
  final Color colour;
  final Widget cardChild;
  final Function onPress;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      //passing a function
      onTap:onPress,
      child: Container(
        child:cardChild,
        margin: EdgeInsets.all(15.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          color: colour ,
        ),
      ),
    );
  }
}
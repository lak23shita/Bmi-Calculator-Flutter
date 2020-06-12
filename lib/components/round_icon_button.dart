import 'package:flutter/material.dart';

class RoundIconButton extends StatelessWidget{
  RoundIconButton({@required this.icon,@required this.onPressed});

  final IconData icon;
  final Function onPressed;
  @override
  Widget build(BuildContext context){
    return RawMaterialButton(
      child:Icon(icon),
      //when onpressed is used than only elevation can be implemented
      onPressed: onPressed,
      //shadow
      elevation: 6.0,
      //border
      constraints:BoxConstraints.tightFor(
        width:56.0,
        height:56.0,
      ),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
      fillColor:Color(0xFF4C4F5E),
    );
  }
}

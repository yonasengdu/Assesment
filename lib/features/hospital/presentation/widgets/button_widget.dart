import 'package:flutter/material.dart';

class ButtonWidget extends StatelessWidget {
  final double buttonWidth;
  final String buttonText ;
  final bool buttonType ;

  const ButtonWidget({super.key,required this.buttonText,required this.buttonType,required this.buttonWidth});

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Container(
         width: buttonWidth,
         height: 50,
         decoration:  BoxDecoration(
          border: Border.all(
            color: buttonType == true ? Colors.red : Colors.blue
          ),
          borderRadius: BorderRadius.circular(8.0),
          color: buttonType == true ? Colors.white : Colors.blue,
        ),
        child: Center(
          child: Text(buttonText,
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w600,
            color: buttonType == true ? Colors.red : Colors.white
          ),),),
        
      ),
    );
  }
}
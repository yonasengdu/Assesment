import 'package:flutter/material.dart';

class NumberWidget extends StatelessWidget {
  final num number;
  const NumberWidget({super.key, required this.number,});

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.all(5.0),
       child: 
      Container(
      decoration: BoxDecoration(
        color: number == 41 ? Colors.blue:  Colors.white ,
        borderRadius: BorderRadius.circular(8),
        boxShadow: const [
                BoxShadow(
                  color: Colors.grey,
                  blurRadius: 1,
                  offset: Offset(0, 1),
                ),
              ],
      ),
          
      
      width: 60,
      height: 60,
      child: Center(
        child: Text(number.toString(),
        style: TextStyle(
          color: number == 41? Colors.white : Colors.black,
          fontSize: 20,
          fontWeight: FontWeight.w500
        ),
        )
      ),
      
            ));
  }
}
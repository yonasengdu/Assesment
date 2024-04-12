import 'package:flutter/material.dart';

class TextBoxWidget extends StatelessWidget {
  final double? height;
  final String title;
  const TextBoxWidget({super.key,this.height,required this.title});

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.only(top: 4),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
                padding: const EdgeInsets.symmetric(vertical: 4 ),
                child: Text(title,
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500
                ),),
              ),
          Container(
            width: double.infinity,
            height: height == null ? 50 : height,
            decoration: BoxDecoration(
              color:  Color.fromRGBO(243, 243, 243, 1),
              borderRadius: BorderRadius.circular(8)
            ),
          ),
        ],
      ),
    );
  }
}
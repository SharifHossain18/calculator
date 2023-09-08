import 'package:flutter/material.dart';

class DisplayText extends StatelessWidget {
   DisplayText({super.key});


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        children: [
          Row(
            children: [
              Text("Angle",
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w300
              ),
              ),
            ],
          ),
          SizedBox(height: 10,),
          Row(
            children: [
              Text("Calculator",
              style: TextStyle(
                fontSize: 35,
              ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
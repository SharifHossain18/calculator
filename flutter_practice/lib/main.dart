
import 'package:flutter/material.dart';
import 'package:flutter_practice/homepage.dart';
import 'package:flutter_practice/practice.dart';
import 'package:get/get.dart';

void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      color: Colors.black26,
      debugShowCheckedModeBanner: false,
      home: HomePage(),
      // home: Calculator(),

    );
  }
}










// import 'package:math_expressions/math_expressions.dart';

// void main(){

// Parser p=Parser();
// Expression exp=p.parse("2+2*7");
// double result=exp.evaluate(EvaluationType.REAL, ContextModel());
// print(result);

// }
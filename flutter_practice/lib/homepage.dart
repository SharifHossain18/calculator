
import 'package:flutter/material.dart';
import 'package:flutter_practice/display_screen.dart';
import 'package:flutter_practice/expanded_screen.dart';
import 'package:flutter_practice/defalut_scareen.dart';
import 'package:get/get.dart';




class HomePage extends StatelessWidget {
   HomePage({super.key});

  List <String> number =['AC','*','%','/','7','8','9','*','4','5','6','-','1','2','3','+','<>','0','.','='];
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SignUp(),
    );
  }

}
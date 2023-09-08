

import 'package:flutter/material.dart';
import 'package:flutter_practice/display_screen.dart';
import 'package:flutter_practice/display_text.dart';
import 'package:flutter_practice/defalut_scareen.dart';
import 'package:get/get.dart';
import 'package:math_expressions/math_expressions.dart';
import 'dart:math';

class Login extends StatefulWidget {
   Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  List <String> number=['cos','log','(',')','DEG','sin','tan','√','ln','INV','AC','*','%','pi','/','7','8','9',
                         'e','*','4','5','6','!','-','1','2','3','^','+','<>','0','.','','='];

  final TextEditingController inputcontroller=TextEditingController();
  final TextEditingController answercontroller=TextEditingController();
  

  var userinput='';

  void calculatorButton(index){
    if(index=='10'){
      userinput='';
      inputcontroller.text=userinput;
      answercontroller.text=userinput;

    }
    else if(index=='11'){
      userinput=userinput.substring(0,userinput.length-1);
      inputcontroller.text=userinput;
    }
    else if(index=='34'){
      String finaluserinput=userinput;   
      finaluserinput=userinput.replaceAll("pi", "3.1416");  
      finaluserinput=userinput.replaceAll("e", "2.71828183"); 
      finaluserinput=userinput.replaceAll("√", "sqrt");

      Parser p=Parser();
      Expression exp=p.parse(finaluserinput);
      double result =exp.evaluate(EvaluationType.REAL, ContextModel());
      answercontroller.text=result.toString();
    }
    else if(index=='30'){
      Get.to(SignUp());
    }
    else{
      index=int.parse(index);
      inputcontroller.text=userinput += number[index].toString();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(      
      body: Column(        
        children: [
          DisplayText(),
          TextField(
            controller: inputcontroller,
          ),
          TextField(
            controller: answercontroller,
          ),
          Expanded(
            child: GridView.builder(
               itemCount: number.length, 
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 5), 
              itemBuilder: (context,index){          
              return  Padding(
                padding: const EdgeInsets.all(10.0),
                child: GestureDetector(
                  onTap: () {
                    calculatorButton(index.toString());
                  },
                  child: Container(
                              height: 30,
                              width: 20,
                              child: Center(child: Text("${number[index]}",
                              style: TextStyle(
                                fontSize: 20
                              ),
                              
                              )),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                shape: BoxShape.circle
                              ),
                            ),
                ),
              );
              }),
          ),
        ],
      ),

    );
  }
}

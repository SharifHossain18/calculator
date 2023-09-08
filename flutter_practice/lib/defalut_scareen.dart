

import 'package:flutter/material.dart';
import 'package:flutter_practice/display_screen.dart';
import 'package:flutter_practice/display_text.dart';
import 'package:flutter_practice/expanded_screen.dart';
// import 'package:flutter_practice/functions.dart';
import 'package:get/get.dart';
import 'package:math_expressions/math_expressions.dart';

class SignUp extends StatefulWidget {
   SignUp({super.key});


  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  List <String> number=['AC','*','%','/','7','8','9','*','4','5','6','-','1','2','3','+','<>','0','.','='];
  final TextEditingController inputcontroller=TextEditingController();
  final TextEditingController answercontroller=TextEditingController();
  

  var userinput='';

  void calculatorButton(index){
    if(index=='0'){
      userinput='';
      inputcontroller.text=userinput;
      answercontroller.text=userinput;

    }
    else if(index=='1'){
      userinput=userinput.substring(0,userinput.length-1);
      inputcontroller.text=userinput;
    }
    else if(index=='19'){
      String finaluserinput=userinput;      
      Parser p=Parser();
      Expression exp=p.parse(finaluserinput);
      double result =exp.evaluate(EvaluationType.REAL, ContextModel());
      answercontroller.text=result.toString();
    }
    else if(index=='16'){
      Get.to(Login());
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
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 4), 
          itemBuilder: (context,index){          
          return  Padding(
            padding: const EdgeInsets.all(10.0),
            child: GestureDetector(
              onTap: () {
                // print(userinput);
                // print(index);
                // inputcontroller.text += number[index].toString();
                calculatorButton(index.toString()); 
               
                
              },
              child: Container(
                          height: 30,
                          width: 20,
                          child: Center(child: Text("${number[index]}",
                          style: TextStyle(
                            fontSize: 22,
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
          )
        ],
        
      ),

    );
  }
}

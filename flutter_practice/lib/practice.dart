
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:math_expressions/math_expressions.dart';


class Calculator extends StatefulWidget {
   Calculator({super.key});
  @override
  State<Calculator> createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {

  final TextEditingController mycontroller1=TextEditingController();
  final TextEditingController mycontroller2=TextEditingController();
  var userinput='';

  void calculatorButton(index){
    if(index=='0'){
      userinput='';
      mycontroller1.text=userinput;
      mycontroller2.text=userinput;

    }
    else if(index=='1'){
      userinput=userinput.substring(0,userinput.length-1);
      mycontroller1.text=userinput;
    }
    else if(index=='19'){
      String finaluserinput=userinput;
      
      Parser p=Parser();
      Expression exp=p.parse(finaluserinput);
      double result =exp.evaluate(EvaluationType.REAL, ContextModel());
      mycontroller2.text=result.toString();
    }
    else if(index=='16'){
      
    }
    else{
      index=int.parse(index);
      mycontroller1.text=userinput += number[index].toString();
    }
  }


  List <String> number =['AC','*','%','/','7','8','9','*','4','5','6','-','1','2','3','+','<>','0','.','='];
  
  @override
  Widget build(BuildContext context) {
    

    return Scaffold(
      body: Column(
        children: [
          TextField(
            controller: mycontroller1,           
            obscureText: false,   
                  
          ),
          TextField(
            controller: mycontroller2,           
            obscureText: false,           
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(30.0),
              child: GridView.builder(
                itemCount: number.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 4), 
                itemBuilder: (context, index){
                  return GestureDetector(
                    onTap: () {   
                      // mycontroller1.text="sujon";                 
                      mycontroller1.text=userinput += number[index].toString();
                      calculatorButton(index.toString());  

                    },
                    child: Container(
                      margin: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.white
                      ),
                      child: Center(child: Text("${number[index]}",
                      style: TextStyle(
                        fontSize: 35,
                        fontWeight: FontWeight.bold
                      ),
                      
                      )),
                    ),
                  );
                }),
            ),
          ),
        ],
      ),
//       ),
    );
  }
}
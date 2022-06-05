import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class Calculator extends StatefulWidget {
  const Calculator({Key? key}) : super(key: key);

  @override
  State<Calculator> createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  var firstNum;
  var secNum;
  String textToDisplay = ''; //string to display a output
  late String result;
  late String op; 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(Icons.calculate),
        title: const Text('Calculator'),
      ),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Expanded(
              child: Container(
                  alignment: Alignment.bottomRight,
                  child: Padding(
                    padding:const EdgeInsets.only(right: 25.0),
                    child: Text(
                      textToDisplay,
                      style:const TextStyle(
                          fontSize: 25.0, fontWeight: FontWeight.w600),
                    ),
                  )),
            ),
            //Creating buttons
            Row(
              children: [
                createButton('9'),
                createButton('8'),
                createButton('7'),
                createButton('+'),
              ],
            ),
            Row(
              children: [
                createButton('6'),
                createButton('5'),
                createButton('4'),
                createButton('-'),
              ],
            ),
            Row(
              children: [
                createButton('3'),
                createButton('2'),
                createButton('1'),
                createButton('*'),
              ],
            ),
            Row(
              children: [
                createButton('C'),
                createButton('0'),
                createButton('='),
                createButton('/'),
              ],
            ),
          ],
        ),
      ),
    );
  }

// str is a btn value on which diff operators are performed like C, +, -, * and more 
  Widget createButton(String str) {
    return Expanded(
        child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: OutlinedButton(
        onPressed: () => btnClicked(str),
        child: Text(
          str,
          style:
              const TextStyle(color: Colors.red, fontWeight: FontWeight.w900),
        ),
      ),
    ));
  }

// method to perform operations,
  btnClicked(String str) {
    // setting all values empty
    if(str=='C'){
      textToDisplay = ' ';
      firstNum =0;
      secNum =0;
      result = ' ';
    }
    else if(str=='+' || str=='-' || str=='*' || str=='/'){
// on clicking any op, store entered num in fnum then on clicking '=' store 2nd value in secNum perform the op stored in op  
     firstNum = int.parse(textToDisplay);
     result = '';
     op = str; 
    }
    else if( str == '='){
      secNum = int.parse(textToDisplay);
      if(op=='+'){
        result= (firstNum + secNum).toString();
      }
      if(op=='-'){
        result= (firstNum - secNum).toString();
      }
      if(op=='*'){
        result= (firstNum * secNum).toString();
      }
      if(op=='/'){
        result= (firstNum / secNum).toString();
      }
      if(op=='+'){
        result= (firstNum + secNum).toString();
      }
    }
    else {
      result = int.parse(textToDisplay + str).toString();
    }
    setState(() {
      textToDisplay = result;
    });

  }
}

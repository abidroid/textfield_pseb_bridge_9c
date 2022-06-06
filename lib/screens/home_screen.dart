import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  var firstController = TextEditingController();
  var secondController = TextEditingController();
  var result = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Calculator'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: SingleChildScrollView(
          child: Column(
            children: [

              TextField(
                controller: firstController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  hintText: 'First Number'
                ),
              ),
              const SizedBox(height: 10,),


              TextField(
                controller: secondController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                    hintText: 'Second Number'
                ),
              ),
              const SizedBox(height: 10,),

              Row(
                children: [
                  Expanded(child: ElevatedButton(
                    onPressed: (){
                      calculate('+');

                    },
                    child: const Text('+', style: TextStyle(fontSize: 20),),
                  )),
                  const SizedBox(width: 5,),
                  Expanded(child: ElevatedButton(
                    onPressed: (){
                      calculate('-');
                    },
                    child: const Text('-', style: TextStyle(fontSize: 20),),
                  )),
                  const SizedBox(width: 5,),

                  Expanded(child: ElevatedButton(
                    onPressed: (){
                      calculate('*');

                    },
                    child: const Text('*', style: TextStyle(fontSize: 20),),
                  )),
                  const SizedBox(width: 5,),

                  Expanded(child: ElevatedButton(
                    onPressed: (){
                      calculate('/');

                    },
                    child: const Text('/', style: TextStyle(fontSize: 20),),
                  )),

                ],

              ),
              Text(result, style: const TextStyle(fontSize: 20),),

            ],
          ),
        ),
      ),
    );
  }

  calculate( String opr ){

    String first = firstController.text.trim();
    String second = secondController.text.trim();

    if( first.isEmpty || second.isEmpty){
      Fluttertoast.showToast(msg: 'Please provide both numbers');
    }
    else{
      int res = 0;
      switch(opr){
        case '+':
          res = int.parse(first) + int.parse(second);
          break;
        case '-':
          res = int.parse(first) - int.parse(second);
          break;
        case '*':
          res = int.parse(first) * int.parse(second);
          break;
        case '/':
          res = int.parse(first) ~/ int.parse(second);
          break;
      }

      setState((){
        result = '$res';
      });
    }
  }
}

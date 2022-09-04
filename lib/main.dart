import 'package:calcu/bloc/blocCalculadora/bloc_calculadora_bloc.dart';
import 'package:calcu/widget/button.dart';
import 'package:calcu/widget/pantalla.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(providers: [
      BlocProvider(create: (_) => BlocCalculadoraBloc())
    ], child: MaterialApp(home: Calculator()));
  }
}
class Calculator extends StatefulWidget {
  @override
  _CalculatorState createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  dynamic displaytxt = 20;
  List<String>resultados=[];
  //Button Widget
  @override
  Widget build(BuildContext context) {
    //Calculator
    final blc=BlocProvider.of<BlocCalculadoraBloc>(context);
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text('Calculadora_Mirko Alarcon',
        style: TextStyle(
          color: Colors.white,
        ),
        ),
        backgroundColor: Colors.blue,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 2),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            // Calculator display
            SizedBox(
              height: 90,
            ),
            Pantalla(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                calcButton('Cl',Colors.yellow[700]!,Colors.white,()=>blc.add(eliminar())),
                calcButton('+/-',Colors.yellow[700]!,Colors.white,()=>(){}),
                calcButton('%',Colors.yellow[700]!,Colors.white,()=>blc.add(operador('%'))),
                calcButton('/',Colors.redAccent,Colors.white,()=>blc.add(operador('/'))),
              ],
            ),
            const SizedBox(height: 10,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                calcButton('7',Colors.red,Colors.white,()=>blc.add(addNum('7'))),
                calcButton('8',Colors.red,Colors.white,()=>blc.add(addNum('8'))),
                calcButton('9',Colors.red,Colors.white,()=>blc.add(addNum('9'))),
                calcButton('x',Colors.redAccent,Colors.white,()=>blc.add(operador('x'))),
              ],
            ),
            SizedBox(height: 10,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                calcButton('4',Colors.red,Colors.white,()=>blc.add(addNum('4'))),
                calcButton('5',Colors.red,Colors.white,()=>blc.add(addNum('5'))),
                calcButton('6',Colors.red,Colors.white,()=>blc.add(addNum('6'))),
                calcButton('-',Colors.redAccent,Colors.white,()=>blc.add(operador('-'))),
              ],
            ),
            SizedBox(height: 10,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                calcButton('1',Colors.red,Colors.white,()=>blc.add(addNum('1'))),
                calcButton('2',Colors.red,Colors.white,()=>blc.add(addNum('2'))),
                calcButton('3',Colors.red,Colors.white,()=>blc.add(addNum('3'))),
                calcButton('+',Colors.redAccent,Colors.white,()=>blc.add(operador('+'))),
              ],
            ),
            SizedBox(height: 10,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                //this is button Zero
                // ignore: deprecated_member_use
                RaisedButton(
                  padding: EdgeInsets.fromLTRB(26, 20, 128, 20),
                  onPressed: (){
                    blc.add(addNum('0'));
                  },
                  shape: RoundedRectangleBorder(),
                  child: Text('0',
                    style: TextStyle(
                        fontSize: 35,
                        color: Colors.white),
                  ),
                  color: Colors.red,
                ),
                calcButton('.',Colors.red,Colors.white,()=>blc.add(addNum('.'))),
                calcButton('=',Colors.redAccent,Colors.white,()=>blc.add(resultado())),
              ],
            ),
            SizedBox(height: 10,),
          ],
        ),
      ),
    );
  }

}

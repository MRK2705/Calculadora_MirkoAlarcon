part of 'bloc_calculadora_bloc.dart';

@immutable
abstract class BlocCalculadoraEvent {}

class eliminar extends BlocCalculadoraEvent{
}

class addNum extends BlocCalculadoraEvent{
  String num; 
  addNum(this.num);
}

class operador extends BlocCalculadoraEvent{
  String op;
  operador(this.op);
}

class resultado extends BlocCalculadoraEvent{
  //no espera nada;
}




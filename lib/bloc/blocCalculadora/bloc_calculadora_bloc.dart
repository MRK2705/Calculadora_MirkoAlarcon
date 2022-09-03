import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'bloc_calculadora_event.dart';
part 'bloc_calculadora_state.dart';

class BlocCalculadoraBloc extends Bloc<BlocCalculadoraEvent, BlocCalculadoraInitial> {
  BlocCalculadoraBloc() : super(BlocCalculadoraInitial()) {
    on<eliminar>((event, emit){
      emit(BlocCalculadoraInitial());  
    });
    on<addNum>((event, emit) {
      if(state.operation==''){
        emit(BlocCalculadoraInitial(
          num1: state.num1+event.num
        ));
      }
      else{
        emit(BlocCalculadoraInitial(
          num2: state.num2+event.num, num1:state.num1, operation: state.operation
        ));
      }
    });
    on<operador>((event, emit) {
      if(state.result=='' && state.num2==''){
        emit(BlocCalculadoraInitial(
          operation: event.op, num1: state.num1
        ));
      }
      else{
        emit(BlocCalculadoraInitial(
          operation: event.op, num1: state.result
        ));
      }
    });
    on<resultado>((event, emit) {
      emit(BlocCalculadoraInitial(
        result: total(state.num1, state.num2, state.operation), num1: state.num1, num2: state.num2, operation: state.operation
      ));
    });
  }
}

String total(String num1, String num2, String op){

  double n1=double.parse(num1);
  double n2=double.parse(num2);
  double tot=0.0;

    if(op == '+') {
      tot=n1+n2;
    } else if( op == '-') {
      tot=n1-n2;
    } else if(op == 'x') {
      tot=n1*n2;
    } else if( op == '/') {
      tot=n1/n2;
    }
    //condiciones de division sobre 0;
 return tot.toString();

}

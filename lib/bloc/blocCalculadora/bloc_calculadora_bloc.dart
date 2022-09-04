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
        if(!state.num1.contains('.')||event.num!='.'){
          emit(BlocCalculadoraInitial(
          num1: state.num1+event.num,
          info: state.num1+event.num
          ));
        }
      }
      else{
        if(!state.num2.contains('.')||event.num!='.'){
          emit(BlocCalculadoraInitial(
          num2: state.num2+event.num, num1:state.num1, operation: state.operation,
          info: state.num1+state.operation+state.num2+event.num
          ));
        }
      }
    });
    on<operador>((event, emit) {
      if(state.result=='' && state.num2==''){
        emit(BlocCalculadoraInitial(
          operation: event.op, num1: state.num1,
          info: state.num1+event.op
        ));
      }
      else{
        emit(BlocCalculadoraInitial(
          operation: event.op, num1: state.result,
          info: state.result+event.op
        ));
      }
    });
    on<resultado>((event, emit) {
      emit(BlocCalculadoraInitial(
        result: total(state.num1, state.num2, state.operation), num1: state.num1, num2: state.num2, operation: state.operation,
        info: total(state.num1, state.num2, state.operation)
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
    } else if( op == '%') {
      tot=n1*(n2/100);
    }
    //condiciones de division sobre 0;
 return tot.toString();

}

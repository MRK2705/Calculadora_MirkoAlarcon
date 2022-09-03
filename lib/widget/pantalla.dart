import 'package:calcu/bloc/blocCalculadora/bloc_calculadora_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Resultados extends StatelessWidget {
  const Resultados({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BlocCalculadoraBloc, BlocCalculadoraInitial>(
        builder: ((context, state) {
    return SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Text(state.result,
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 65,
                      ),
                    ),
                  )
                ],
              ),
            );
  }));}
}
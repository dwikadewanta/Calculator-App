import 'package:calculator/calculator_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:math_expressions/math_expressions.dart';

class CalculatorCubit extends Cubit<CalculatorState> {
  CalculatorCubit()
      : super(CalculatorState(
          currentInput: '',
          result: '0',
        ));

  void appendNumber(String number) {
    emit(state.copyWith(currentInput: state.currentInput + number));
  }

  void clear() {
    emit(
      CalculatorState(
        currentInput: '',
        result: '0',
      ),
    );
  }

  void deleteLastCharacter() {
    if (state.currentInput.length > 1) {
      emit(state.copyWith(
          currentInput:
              state.currentInput.substring(0, state.currentInput.length - 1)));
    } else {
      emit(state.copyWith(currentInput: '0'));
    }
  }

  void calculate() {
    try {
      Parser parser = Parser();
      ContextModel cm = ContextModel();

      String convertPercentage = state.currentInput.replaceAllMapped(
        RegExp(r'(\d+(\.\d+)?)%'),
        (match) {
          return '${match[1]} / 100';
        },
      );
      Expression exp = parser.parse(convertPercentage);

      double evalResult = exp.evaluate(EvaluationType.REAL, cm);
      String resultString = evalResult.toString();

      if (resultString.length > 17) {
        resultString = resultString.substring(0, 17);
      }

      emit(state.copyWith(result: "= $resultString"));
    } catch (e) {
      emit(state.copyWith(result: 'Error'));
    }
  }
}

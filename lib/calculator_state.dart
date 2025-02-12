import 'dart:ui';

class CalculatorState {
  CalculatorState({
    required this.currentInput,
    required this.result,
  });

  final String currentInput;
  final String result;

  CalculatorState copyWith(
      {String? currentInput, String? result, Color? colorCurrentInput}) {
    return CalculatorState(
      currentInput: currentInput ?? this.currentInput,
      result: result ?? this.result,
    );
  }
}

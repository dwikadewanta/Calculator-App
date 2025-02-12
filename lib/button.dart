import 'package:calculator/counter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RectangleButton extends StatelessWidget {
  const RectangleButton({
    super.key,
    required this.btnText,
    required this.btnType,
    required this.backgroundColor,
    required this.foregroundColor,
    this.isIconBtn = false,
  });

  final String btnText;
  final String btnType;
  final Color backgroundColor;
  final Color foregroundColor;
  final bool isIconBtn;

  buttonClicked(BuildContext context) {
    switch (btnText) {
      case 'AC':
        context.read<CalculatorCubit>().clear();
      case '=':
        context.read<CalculatorCubit>().calculate();
      case 'x':
        context.read<CalculatorCubit>().deleteLastCharacter();
      default:
        context.read<CalculatorCubit>().appendNumber(btnText);
    }
  }

  Widget rectangleBtn(BuildContext context) {
    return ElevatedButton(
      onPressed: () => buttonClicked(context),
      style: ElevatedButton.styleFrom(
        minimumSize: Size(MediaQuery.of(context).size.width * 0.16, MediaQuery.of(context).size.width * 0.16),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(15),
          ),
        ),
        backgroundColor: backgroundColor,
        foregroundColor: foregroundColor,
      ),
      child: isIconBtn
          ? Image.asset(
              Theme.of(context).brightness == Brightness.dark
                  ? "assets/delete_logo_dark.png"
                  : "assets/delete_logo_light.png",
              fit: BoxFit.cover,
            )
          : Text(
              btnText,
              style: TextStyle(fontSize: MediaQuery.of(context).size.width * 0.075),
            ),
    );
  }

  Widget heightRectangleBtn(BuildContext context) {
    return ElevatedButton(
      onPressed: () => buttonClicked(context),
      style: ElevatedButton.styleFrom(
        minimumSize: Size(MediaQuery.of(context).size.width * 0.16, MediaQuery.of(context).size.width * 0.38),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(15),
          ),
        ),
        backgroundColor: backgroundColor,
        foregroundColor: foregroundColor,
      ),
      child: Text(
        btnText,
        style: TextStyle(fontSize: MediaQuery.of(context).size.width * 0.084),
      ),
    );
  }

  Widget smallRectangleBtn(BuildContext context) {
    return Expanded(
      child: ElevatedButton(
        onPressed: () => buttonClicked(context),
        style: ElevatedButton.styleFrom(
          minimumSize: Size(MediaQuery.of(context).size.width * 0.16, MediaQuery.of(context).size.width * 0.1),
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(10),
            ),
          ),
          backgroundColor: backgroundColor,
          foregroundColor: foregroundColor,
        ),
        child: Text(
          btnText,
          style: TextStyle(fontSize: MediaQuery.of(context).size.width * 0.045),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    switch (btnType) {
      case "small_rectangle":
        return smallRectangleBtn(context);
      case "height_rectangle":
        return heightRectangleBtn(context);
      default:
        return rectangleBtn(context);
    }
  }
}

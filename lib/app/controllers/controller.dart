import 'package:function_tree/function_tree.dart';

enum TypeCommand { number, operator, ac }

class CalculatorController {
  CalculatorController();

  String value = '0';
  bool hadDisplayedAnyResultExpression = false;

  displayCommand(String command, TypeCommand typeCommand) {
    resultExpressionHandler(command, typeCommand);
    hadDisplayedAnyResultExpression = false;

    if (value == '0') {
      return value = command;
    }

    return value += command;
  }

  resultExpressionHandler(String command, TypeCommand typeCommand) {
    try {
      if (hadDisplayedAnyResultExpression &&
          typeCommand == TypeCommand.number) {
        resetPanelValue(command);
      }
    } catch (_) {
      return;
    }
  }

  resetPanelValue(String command) {
    value = '';
  }

  result() {
    try {
      hadDisplayedAnyResultExpression = true;

      final parsedValue = value.interpret();
      final hasValueDecimals = parsedValue % 1 != 0;

      if (hasValueDecimals) {
        return value = value.interpret().toDouble().toString();
      }

      return value = value.interpret().toInt().toString();
    } catch (_) {
      hadDisplayedAnyResultExpression = false;
      return;
    }
  }

  allClear() {
    return value = '0';
  }

  clear() {
    if (value.length == 1) {
      return value = '0';
    }

    int end = value.length - 1;
    return value = value.substring(0, end);
  }
}

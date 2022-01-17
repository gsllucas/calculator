import 'package:function_tree/function_tree.dart';

enum TypeCommand { number, operator, ac }

class CalculatorController {
  CalculatorController();

  String value = '0';
  bool hadDisplayedAnyResultExpression = false;
  bool isLastCommandTappedAnOperator = false;

  handlerCommand(String command, TypeCommand typeCommand) {
    if (!isLastCommandTappedAnOperator || typeCommand == TypeCommand.number) {
      displayCommand(command, typeCommand);
    }

    replaceLastOperatorSymbol(command, typeCommand);
    checkLastCommandOperator();
  }

  displayCommand(String command, TypeCommand typeCommand) {
    resultExpressionHandler(command, typeCommand);
    hadDisplayedAnyResultExpression = false;

    if (value == '0') {
      return value = command;
    }

    return value += command;
  }

  replaceLastOperatorSymbol(String command, TypeCommand typeCommand) {
    if (typeCommand == TypeCommand.operator) {
      final splitedValue = value.split('');
      final lastCommandTapped = splitedValue[splitedValue.length - 1];

      if (lastCommandTapped == '+' ||
          lastCommandTapped == '-' ||
          lastCommandTapped == '*' ||
          lastCommandTapped == '/' ||
          lastCommandTapped == '%' ||
          lastCommandTapped == '.') {
        final start = value.length - 1;
        final end = value.length;
        return value = value.replaceRange(start, end, command);
      }
    }
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

  checkLastCommandOperator() {
    final splitedValue = value.split('');
    final lastCommandTapped = splitedValue[splitedValue.length - 1];

    (lastCommandTapped == '+' ||
            lastCommandTapped == '-' ||
            lastCommandTapped == '*' ||
            lastCommandTapped == '/' ||
            lastCommandTapped == '%' ||
            lastCommandTapped == '.')
        ? isLastCommandTappedAnOperator = true
        : isLastCommandTappedAnOperator = false;
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

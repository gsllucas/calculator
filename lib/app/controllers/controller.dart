import 'package:function_tree/function_tree.dart';

enum TypeCommand { number, operator, ac }

class CalculatorController {
  CalculatorController();

  String value = '0';
  bool hadDisplayedAnyResultExpression = false;

  displayCommand(String command, TypeCommand typeCommand) {
    // checkLastCommand();

    if (typeCommand == TypeCommand.operator) {
      hadDisplayedAnyResultExpression = false;
    }

    if (hadDisplayedAnyResultExpression && typeCommand == TypeCommand.number) {
      hadDisplayedAnyResultExpression = false;
      value = '';
      return value += command;
    }

    if (value == '0') {
      return value = command;
    }

    return value += command;
  }

  // checkLastCommand() {
  //   final splitValue = value.split('');
  //   final lastDigitCommand = splitValue[splitValue.length - 1];
  // }

  result() {
    final parsedValue = value.interpret();
    final modDifferentToZero = parsedValue % 1 != 0;

    hadDisplayedAnyResultExpression = true;

    if (modDifferentToZero) {
      return value = value.interpret().toDouble().toString();
    }

    return value = value.interpret().toInt().toString();
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

  List<String> splitValue(String value, String split) {
    return value.split(split);
  }
}

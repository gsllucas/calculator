import 'package:function_tree/function_tree.dart';

enum TypeCommand { number, operator, ac }

class CalculatorController {
  CalculatorController();

  String value = '0';

  display_command(String command) {
    if (value == '0') {
      return value = command;
    }

    return value += command;
  }

  checkCommand(String command, TypeCommand typeCommand) {}

  result() {
    return value = value.interpret().toString();
  }

  all_clear() {
    return value = '0';
  }

  clear() {
    if (value.length == 1) {
      return value = '0';
    }

    int end = value.length - 1;
    return value = value.substring(0, end);
  }

  separate_panel_strings(String value) {
    // value.
  }

  List<String> splitValue(String value, String split) {
    return value.split(split);
  }
}

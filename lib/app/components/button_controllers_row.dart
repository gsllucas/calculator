import 'package:flutter/material.dart';
import 'package:flutter_project/app/components/button.dart';

class ButtonControllersRow extends StatelessWidget {
  final List<Button> buttons;

  const ButtonControllersRow({
    Key? key,
    required this.buttons,
  }) : super(key: key);

  renderLayout() {
    buttons.fold(<Button>[], (previousValue, button) {});
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: buttons.fold(<Widget>[], (list, button) {
          final sizedSpace = [SizedBox(width: 1), button];
          list.isEmpty ? list.add(button) : list.addAll(sizedSpace);
          return list;
        }),
      ),
    );
  }
}

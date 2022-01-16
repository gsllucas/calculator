import 'package:flutter/material.dart';
import 'package:flutter_project/app/components/button.dart';

class ButtonControllersColumun extends StatelessWidget {
  final List<Widget> buttons;

  const ButtonControllersColumun({Key? key, required this.buttons})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
        children: buttons.fold(<Widget>[], (list, button) {
      final sizedSpace = [SizedBox(height: 1), button];
      list.isEmpty ? list.add(button) : list.addAll(sizedSpace);
      return list;
    }));
  }
}

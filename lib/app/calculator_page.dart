import 'package:flutter/material.dart';
import 'package:flutter_project/app/components/button.dart';
import 'package:flutter_project/app/components/button_controllers_column.dart';
import 'package:flutter_project/app/components/button_controllers_row.dart';
import 'package:flutter_project/app/components/panel_screen.dart';
import 'package:flutter_project/app/controllers/controller.dart';

class CalculatorWidget extends StatefulWidget {
  const CalculatorWidget({Key? key}) : super(key: key);

  @override
  State<CalculatorWidget> createState() => _CalculatorWidgetState();
}

class _CalculatorWidgetState extends State<CalculatorWidget> {
  final controller = CalculatorController();

  displayValueOnTappedButton(String command, TypeCommand typeCommand) =>
      setState(() => controller.handlerCommand(command, typeCommand));

  allClear() => setState(() => controller.allClear());

  clear() => setState(() => controller.clear());

  result() => setState(() => controller.result());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(child: PanelScreen(value: controller.value)),
          Container(
            height: 450,
            padding: EdgeInsets.all(2),
            decoration: BoxDecoration(
              color: Color(0xfff3f3f3),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    children: [
                      ButtonControllersRow(
                        buttons: [
                          Button(
                            child: 'AC',
                            color: Colors.redAccent,
                            cb: allClear,
                          ),
                          Button(
                            child: Icon(Icons.backspace),
                            color: Colors.orange,
                            cb: clear,
                          ),
                          Button(
                            child: '%',
                            cb: () => displayValueOnTappedButton(
                              '%',
                              TypeCommand.operator,
                            ),
                            color: Colors.orange,
                          ),
                        ],
                      ),
                      SizedBox(height: 1),
                      ButtonControllersRow(
                        buttons: [
                          Button(
                            child: '7',
                            cb: () => displayValueOnTappedButton(
                              '7',
                              TypeCommand.number,
                            ),
                          ),
                          Button(
                            child: '8',
                            cb: () => displayValueOnTappedButton(
                              '8',
                              TypeCommand.number,
                            ),
                          ),
                          Button(
                            child: '9',
                            cb: () => displayValueOnTappedButton(
                              '9',
                              TypeCommand.number,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 1),
                      ButtonControllersRow(
                        buttons: [
                          Button(
                            child: '4',
                            cb: () => displayValueOnTappedButton(
                              '4',
                              TypeCommand.number,
                            ),
                          ),
                          Button(
                            child: '5',
                            cb: () => displayValueOnTappedButton(
                              '5',
                              TypeCommand.number,
                            ),
                          ),
                          Button(
                            child: '6',
                            cb: () => displayValueOnTappedButton(
                              '6',
                              TypeCommand.number,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 1),
                      ButtonControllersRow(
                        buttons: [
                          Button(
                            child: '1',
                            cb: () => displayValueOnTappedButton(
                              '1',
                              TypeCommand.number,
                            ),
                          ),
                          Button(
                            child: '2',
                            cb: () => displayValueOnTappedButton(
                              '2',
                              TypeCommand.number,
                            ),
                          ),
                          Button(
                            child: '3',
                            cb: () => displayValueOnTappedButton(
                              '3',
                              TypeCommand.number,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 1),
                      ButtonControllersRow(
                        buttons: [
                          Button(
                            child: '0',
                            cb: () => displayValueOnTappedButton(
                              '0',
                              TypeCommand.number,
                            ),
                            size: 2,
                          ),
                          Button(
                            child: ',',
                            cb: () => displayValueOnTappedButton(
                              '.',
                              TypeCommand.number,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 1),
                    ],
                  ),
                ),
                SizedBox(width: 1),
                ButtonControllersColumun(
                  buttons: [
                    Button(
                      child: '/',
                      color: Colors.orange,
                      cb: () => displayValueOnTappedButton(
                        '/',
                        TypeCommand.operator,
                      ),
                    ),
                    Button(
                      child: '*',
                      color: Colors.orange,
                      cb: () => displayValueOnTappedButton(
                        '*',
                        TypeCommand.operator,
                      ),
                    ),
                    Button(
                      child: '-',
                      color: Colors.orange,
                      cb: () => displayValueOnTappedButton(
                        '-',
                        TypeCommand.operator,
                      ),
                    ),
                    Button(
                      child: '+',
                      size: 1,
                      color: Colors.orange,
                      cb: () => displayValueOnTappedButton(
                        '+',
                        TypeCommand.operator,
                      ),
                    ),
                    Button(
                      child: '=',
                      color: Colors.red,
                      cb: result,
                    ),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

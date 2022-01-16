import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_project/app/controllers/controller.dart';

class PanelScreen extends StatefulWidget {
  final String value;
  final String previousExpression;

  const PanelScreen({
    Key? key,
    required this.value,
    this.previousExpression = '0',
  }) : super(key: key);

  @override
  State<PanelScreen> createState() => _PanelScreenState();
}

class _PanelScreenState extends State<PanelScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(20),
        alignment: Alignment.bottomRight,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            AutoSizeText(
              widget.value,
              style: TextStyle(fontSize: 64),
              maxLines: 1,
            ),
          ],
        ),
      ),
    );
  }
}

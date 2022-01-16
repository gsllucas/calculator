import 'package:flutter/material.dart';
import 'package:flutter_project/app/controllers/controller.dart';

class Button extends StatelessWidget {
  final String child;
  final int? size;
  final Color? color;
  final VoidCallback cb;

  const Button({
    Key? key,
    required this.child,
    this.size,
    this.color,
    required this.cb,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: size ?? 1,
      child: ClipRRect(
        borderRadius: BorderRadius.all(Radius.circular(6)),
        child: ElevatedButton(
          onPressed: () {
            cb.call();
          },
          child: Text(child,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.normal)),
          style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(color ?? Colors.blue)),
        ),
      ),
    );
  }
}

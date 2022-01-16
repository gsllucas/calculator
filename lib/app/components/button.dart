import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  final dynamic child;
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
          child: child is String
              ? Text(child,
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.normal))
              : child,
          style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(color ?? Colors.blue)),
        ),
      ),
    );
  }
}

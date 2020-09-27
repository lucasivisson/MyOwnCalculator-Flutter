import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  static const DELETE = Colors.red;
  static const DEFAULT = Colors.black;
  static const OPERATION = Colors.blue;

  final String text;
  final bool big;
  final Color color;
  final void Function(String) cb;

  Button({
    @required this.text,
    this.big = false,
    this.color = DEFAULT,
    @required this.cb,
  });

  Button.big({
    @required this.text,
    this.big = true,
    this.color = DEFAULT,
    @required this.cb,
  });

  Button.operation({
    @required this.text,
    this.big = false,
    this.color = OPERATION,
    @required this.cb,
  });

  Button.clear({
    @required this.text,
    this.big = true,
    this.color = DELETE,
    @required this.cb,
  });

  Button.delete({
    @required this.text,
    this.big = false,
    this.color = DELETE,
    @required this.cb,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: big ? 2 : 1,
      child: RaisedButton(
        onPressed: () => cb(text),
        child: Text(
          text,
          style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.w400,
            color: this.color,
          ),
        ),
        color: Colors.grey[100],
        splashColor: Colors.blueGrey,
        elevation: 4.0,
      ),
    );
  }
}

import 'package:flutter/material.dart';

class Mybutton extends StatelessWidget {
  final name;
  VoidCallback onpressed;
  Mybutton({Key? key, required this.name, required this.onpressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onpressed,
      color: Theme.of(context).primaryColor,
      child: Text(name),
    );
  }
}

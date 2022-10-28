import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:todo_app/pages/homepage.dart';
import 'package:todo_app/pages/intro.dart';

void main() async {
  //initalise flutter
  await Hive.initFlutter();
//open a box
  var box = await Hive.openBox('mybox');
  runApp(const Myapp());
}

class Myapp extends StatelessWidget {
  const Myapp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.green),
      debugShowCheckedModeBanner: false,
      home: Intor(),
    );
  }
}

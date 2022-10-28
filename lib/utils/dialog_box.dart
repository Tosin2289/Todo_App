import 'package:flutter/material.dart';
import 'package:todo_app/utils/my_button.dart';

class DialogBox extends StatelessWidget {
  final controller;
  VoidCallback onsave;
  VoidCallback oncancle;
  DialogBox({
    Key? key,
    required this.controller,
    required this.onsave,
    required this.oncancle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.green[300],
      content: Container(
        height: 120,
        child:
            Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
          TextField(
            controller: controller,
            decoration: InputDecoration(
                border: OutlineInputBorder(), hintText: 'Add a new task'),
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Mybutton(name: 'Save', onpressed: onsave),
              SizedBox(
                width: 8,
              ),
              Mybutton(name: 'Cancel', onpressed: oncancle),
            ],
          )
        ]),
      ),
    );
  }
}

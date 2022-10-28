import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:todo_app/data/database.dart';
import 'package:todo_app/utils/dialog_box.dart';
import 'package:todo_app/utils/todo_tile.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  //refrence the box
  final mybox = Hive.box('mybox');
  ToDoDatabase db = ToDoDatabase();
  @override
  void initState() {
    // TODO: implement initState
    if (mybox.get('TODOLIST') == null) {
      db.createInitialData();
    } else {
      db.loadData();
    }
    super.initState();
  }

  final control = TextEditingController();

  void checkboxchanged(bool? value, int index) {
    setState(() {
      db.toDOList[index][1] = !db.toDOList[index][1];
    });
    db.updateDataBase();
  }

//save new task
  void saveNewTask() {
    setState(() {
      db.toDOList.add([control.text, false]);
      control.clear();
    });
    Navigator.of(context).pop();
  }

  void CreateNewTask() {
    showDialog(
        context: context,
        builder: ((context) {
          return DialogBox(
            controller: control,
            onsave: saveNewTask,
            oncancle: () => Navigator.of(context).pop(),
          );
        }));
  }

  //delete tile
  void deleteTask(int index) {
    setState(() {
      db.toDOList.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green[300],
      appBar: AppBar(
        backgroundColor: Colors.green[500],
        elevation: 0,
        centerTitle: true,
        title: Text("Todo App"),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.green[500],
        onPressed: CreateNewTask,
        child: Icon(Icons.add),
      ),
      body: ListView.builder(
        itemBuilder: ((context, index) {
          return TodoTile(
            taskname: db.toDOList[index][0],
            taskcomplete: db.toDOList[index][1],
            onChanged: (value) => checkboxchanged(value, index),
            deleteFunction: (context) => deleteTask(index),
          );
        }),
        itemCount: db.toDOList.length,
      ),
    );
  }
}

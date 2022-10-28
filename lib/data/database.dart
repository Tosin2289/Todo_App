import 'package:hive_flutter/hive_flutter.dart';

class ToDoDatabase {
  List toDOList = [];
  final mybox = Hive.box('mybox');
  void createInitialData() {
    toDOList = [
      ['Make bed', false],
      ["Do Exercise", false]
    ];
  }

  void loadData() {
    toDOList = mybox.get("TODOLIST");
  }

  void updateDataBase() {
    mybox.put("TODOLIST", toDOList);
  }
}

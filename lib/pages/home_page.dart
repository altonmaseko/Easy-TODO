import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:to_do_list/utils/dialog_box.dart';
import 'package:to_do_list/utils/to_do_tile.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var myBox = Hive.box("myBox");

  List toDos = [];

  @override
  void initState() {
    super.initState();

    if (myBox.get("todos") == null) {
      print("CREATING NEW myBox");
      myBox.put("todos", [
        [false, "Be a good human"],
        [false, "Exercise"],
        [false, "Eat healthy"]
      ]);
    }

    toDos = myBox.get("todos");
  }

  TextEditingController newListItemController = TextEditingController();

  void onSave() {
    setState(() {
      toDos.add([false, newListItemController.text]);
      myBox.put('todos', toDos);
    });
    Navigator.of(context).pop();
  }

  void delete(count) {
    setState(() {
      toDos.removeAt(count);
      myBox.put('todos', toDos);

      print(toDos);
    });
  }

  void onCancel() {
    Navigator.of(context).pop();
  }

  void addList() {
    showDialog(
        context: context,
        builder: (context) => DialogBox(
              controller: newListItemController,
              onSave: onSave,
              onCancel: onCancel,
            ));
  }

  @override
  Widget build(BuildContext context) {
    print("BUILDING THE WIDGETS");
    print(toDos);
    return Scaffold(
      appBar: AppBar(
        title: const Text("To Do App"),
        centerTitle: true,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: addList,
        backgroundColor: Theme.of(context).primaryColor,
        child: Icon(Icons.add),
      ),
      body: ListView.builder(
        itemCount: toDos.length,
        itemBuilder: (context, count) => ToDoTile(
          onDelete: () => delete(count),
          checked: toDos[count][0],
          toDoText: toDos[count][1],
          onTick: (checked) {
            setState(() {
              toDos[count][0] = !toDos[count][0];
            });
          },
        ),
      ),
    );
  }
}

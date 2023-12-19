import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../models/task_model.dart';
import '../widgets/task_tile.dart';

class TodoListScreen extends StatefulWidget {
  @override
  _TodoListScreenState createState() => _TodoListScreenState();
}
class _TodoListScreenState extends State<TodoListScreen> {
  List<Task> tasks = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Todo List'),
      ),
      body: ListView.builder(
        itemCount: tasks.length,
        itemBuilder: (context, index) {
          return TaskTile(task: tasks[index]);
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (BuildContext context) {
              String newTaskTitle = '';
              return AlertDialog(
                  title: Text('Add Task'),
              content: TextField(
              onChanged: (value) {
              newTaskTitle = value;
              },
              ),
                  actions: [
                  ElevatedButton(
                  onPressed: () {
                setState(() {
                  tasks.add(Task(title: newTaskTitle));
                });
                Navigator.pop(context);
              },
    child: Text('Add'),
                  ),
                  ],
              );
            },
          );
        },
      ),
    );
  }
}

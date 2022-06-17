import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:hive_provider/todoManager/todo_manager.dart';

class AddTodo extends StatefulWidget {
  AddTodo({Key? key}) : super(key: key);
  final formKey = GlobalKey<FormState>();

  @override
  State<AddTodo> createState() => _AddTodoState();
}

class _AddTodoState extends State<AddTodo> {
  String? title;
  String? description;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Todo'),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Form(
            key: widget.formKey,
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: ListView(
                children: [
                  TextFormField(
                    decoration: InputDecoration(hintText: 'Add Title'),
                    onChanged: (value) {
                      setState(() {
                        title = value;
                      });
                    },
                  ),
                  TextFormField(
                    decoration: InputDecoration(hintText: 'Add Description'),
                    onChanged: (value) {
                      setState(() {
                        description = value;
                      });
                    },
                  ),
                  ElevatedButton(
                    child: const Text('Save'),
                    onPressed: () {
                      submitData();
                    },
                  )
                ],
              ),
            )),
      ),
    );
  }

  void submitData() async {
    if (widget.formKey.currentState!.validate()) {
      Box<Todo> todoBox = Hive.box<Todo>('myTodos');
      todoBox.add(Todo(title: title!, description: description!));
    }
  }
}

import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_provider/screen/add_todo.dart';
import 'package:hive_provider/todoManager/todo_manager.dart';
import 'package:hive_flutter/hive_flutter.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Todo provider and hive'),
        centerTitle: true,
      ),
      body: SafeArea(
        child: ValueListenableBuilder(
          valueListenable: Hive.box<Todo>('myTodos').listenable(),
          builder: (context, Box<Todo> box, child) {
            if (box.isEmpty) {
              return const Center(
                child: Text('Liste Henüz Boş'),
              );
            } else {
              return ListView.builder(
                itemCount: box.length,
                itemBuilder: (BuildContext context, int index) {
                  Todo todo = box.getAt(index)!;
                  return ListTile(
                    onLongPress: () async {
                      await box.delete(index);
                    },
                    title: Text(
                      todo.title,
                      style: const TextStyle(fontSize: 25),
                    ),
                    subtitle: Text(
                      todo.description,
                      style: const TextStyle(fontSize: 16),
                    ),
                  );
                },
              );
            }
          },
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => AddTodo(),
          ));
        },
      ),
    );
  }
}

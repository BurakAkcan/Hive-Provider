import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
part 'todo_manager.g.dart';

@HiveType(typeId: 1)
class Todo {
  @HiveField(0)
  final String title;
  @HiveField(1)
  final String description;

  Todo({required this.title, required this.description});
}

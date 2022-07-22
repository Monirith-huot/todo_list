import 'package:flutter/material.dart';
import 'package:to_do_list/model/todo_model.dart';

class TodosOverView extends StatelessWidget {
  final List<Todo> todos;

  const TodosOverView({super.key, required this.todos});

  @override
  Widget build(BuildContext context) {
    final completedTodoListCount = todos.where((e) => e.completed).length;
    return Container(
      padding: const EdgeInsets.symmetric(
        vertical: 12,
        horizontal: 20,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "My Todos",
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            "${completedTodoListCount} of ${todos.length}  completed",
            style: const TextStyle(
              color: Colors.grey,
              fontSize: 20,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}

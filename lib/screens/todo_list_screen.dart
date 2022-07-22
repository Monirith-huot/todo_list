import 'package:flutter/material.dart';
import 'package:to_do_list/screens/add_todo_screen.dart';
import 'package:to_do_list/services/database_service.dart';

import '../model/todo_model.dart';
import '../widgets/todo_tile.dart';
import '../widgets/todos_overview.dart';

class TodoListScreen extends StatefulWidget {
  TodoListScreen({Key? key}) : super(key: key);

  @override
  State<TodoListScreen> createState() => _TodoListScreenState();
}

class _TodoListScreenState extends State<TodoListScreen> {
  List<Todo> _todos = [];

  @override
  void initState() {
    super.initState();
    _getTodos();
  }

  Future<void> _getTodos() async {
    final todos = await DatabaseService.instance.getAllTodos();
    if (mounted) {
      setState(() => _todos = todos);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView.separated(
          padding: const EdgeInsets.symmetric(
            vertical: 32,
          ),
          itemCount: 1 + _todos.length,
          itemBuilder: (ctx, index) {
            if (index == 0) return TodosOverView(todos: _todos);
            final todo = _todos[index - 1];
            return TodoTile(
              updateTodos: _getTodos,
              todo: todo,
            );
          },
          separatorBuilder: (_, __) => const Divider(),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.push(
          context,
          MaterialPageRoute(
            fullscreenDialog: true,
            builder: (_) => AddToDoScreen(
              updateTodos: _getTodos,
            ),
          ),
        ),
        child: Icon(
          Icons.add,
        ),
      ),
    );
  }
}

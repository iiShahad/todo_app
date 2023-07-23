import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/todo.dart';

class TodoNotifier extends StateNotifier<List<ToDo>> {
  TodoNotifier() : super([]);

  void addTodo(ToDo todo) {
    state = [...state, todo];
  }

  void deleteTodo(ToDo todo) {
    final todos = [...state];
    todos.remove(todo);
    state = todos;
  }

  void checkTodo(ToDo todo, bool value) {
    final todos = [...state];
    todos.firstWhere((element) => element == todo).isChecked = value;
    state = todos;
  }
}

final todoProvider =
    StateNotifierProvider<TodoNotifier, List<ToDo>>((ref) => TodoNotifier());

final filteredTodo = Provider.family((ref, DateTime currentDate) {
  final todos = ref.watch(todoProvider);
  final filteredTodos = [];

  for (var element in todos) {
    if (element.time.day == currentDate.day &&
        element.time.month == currentDate.month &&
        element.time.year == currentDate.year) {
      filteredTodos.add(element);
    }
  }
  return filteredTodos;
});

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_app/providers/todo_provider.dart';
import 'package:todo_app/widgets/todo/todo_card.dart';

import '../../providers/days_provider.dart';

class ToDoList extends ConsumerWidget {
  const ToDoList({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final data = ref.watch(daysProvider);
    final List<DateTime> days = data["weekDays"];
    final int currentDay = data["todayIndex"];
    final todos = ref.watch(filteredTodo(days[currentDay]));
    //================================================================
    //when there are no todos--------------------------------------
    return todos.isEmpty
        ? Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                    width: 300,
                    height: 300,
                    child: Image.asset(
                        Theme.of(context).brightness == Brightness.dark
                            ? "assets/empty-state-dark.png"
                            : "assets/empty-state-light.png")),
                const SizedBox(
                  height: 15,
                ),
                Text(
                  "There Are No Todos for Now",
                  style: TextStyle(
                      color: Theme.of(context).brightness == Brightness.dark
                          ? Colors.white38
                          : Colors.black38),
                ),
                const SizedBox(
                  height: 100,
                ),
              ],
            ),
          )
        //when there are todos--------------------------------------
        : Expanded(
            child: ListView.builder(
              itemCount: todos.length,
              itemBuilder: (context, index) {
                return TodoCard(todo: todos[index]);
              },
            ),
          );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:todo_app/models/todo.dart';
import 'package:todo_app/providers/todo_provider.dart';
import 'package:todo_app/widgets/todo/todo_checkbox.dart';

class TodoCard extends ConsumerStatefulWidget {
  const TodoCard({super.key, required this.todo});
  final ToDo todo;

  @override
  ConsumerState<TodoCard> createState() => _TodoCardState();
}

class _TodoCardState extends ConsumerState<TodoCard> {
  @override
  Widget build(BuildContext context) {
    //dismissible config =================================================
    return Dismissible(
      onDismissed: (direction) {
        if (direction == DismissDirection.endToStart) {
          ref.read(todoProvider.notifier).deleteTodo(widget.todo);
        }
      },
      background: Align(
        alignment: Alignment.centerRight,
        child: Container(
          height: 40,
          width: 40,
          decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Theme.of(context).colorScheme.error.withOpacity(0.3)),
          child: Icon(
            Icons.delete,
            color: Theme.of(context).colorScheme.error,
          ),
        ),
      ),
      key: ValueKey(widget.todo),
      //card =================================================
      child: SizedBox(
        height: 80,
        child: Card(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
              side: BorderSide(
                  width: 2,
                  color: widget.todo.isChecked
                      ? Theme.of(context).colorScheme.primary
                      : Colors.transparent)),
          elevation: widget.todo.isChecked ? 0 : 5,
          color: Theme.of(context).colorScheme.background,
          //content =================================================
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
            child: Row(
              children: [
                //checkbox ------------------------------------
                TodoCheckbox(
                  todo: widget.todo,
                  isChecked: (value) {
                    ref
                        .read(todoProvider.notifier)
                        .checkTodo(widget.todo, value);
                  },
                ),
                const SizedBox(
                  width: 15,
                ),
                //data ------------------------------------
                Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.todo.title,
                      style: const TextStyle(fontSize: 18),
                    ),
                    widget.todo.isTimeRequired
                        ? Text(
                            DateFormat.Hm().format(widget.todo.time),
                            style: TextStyle(
                                color: Theme.of(context).brightness ==
                                        Brightness.dark
                                    ? Colors.white30
                                    : Colors.black38),
                          )
                        : const SizedBox(),
                  ],
                ),
                const Spacer(),
                //priority ------------------------------------
                Container(
                  height: 20,
                  width: 20,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: widget.todo.priority == Priority.low
                          ? Theme.of(context).colorScheme.secondary
                          : widget.todo.priority == Priority.medium
                              ? Theme.of(context).colorScheme.tertiary
                              : Theme.of(context).colorScheme.error),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

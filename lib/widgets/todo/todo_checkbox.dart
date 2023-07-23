import 'package:flutter/material.dart';

import '../../models/todo.dart';

class TodoCheckbox extends StatefulWidget {
  const TodoCheckbox({super.key, required this.isChecked, required this.todo});
  final void Function(bool value) isChecked;
  final ToDo todo;
  @override
  State<TodoCheckbox> createState() => _TodoCheckboxState();
}

class _TodoCheckboxState extends State<TodoCheckbox> {
  @override
//==================================================================
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        widget.isChecked(!widget.todo.isChecked);
      },
      child: Container(
        height: 40,
        width: 40,
        decoration: BoxDecoration(
            border: Border.all(
              width: 2,
              color: widget.todo.isChecked
                  ? Theme.of(context).colorScheme.primary
                  : Theme.of(context).brightness == Brightness.dark
                      ? Colors.white30
                      : Colors.black26,
            ),
            shape: BoxShape.circle),
        child: Icon(
          Icons.check,
          color: widget.todo.isChecked
              ? Theme.of(context).colorScheme.primary
              : Theme.of(context).brightness == Brightness.dark
                  ? Colors.white30
                  : Colors.black26,
        ),
      ),
    );
  }
}

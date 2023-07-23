import 'package:flutter/material.dart';
import 'package:todo_app/widgets/form/priority_button.dart';

import '../../models/todo.dart';

class PriorityFormField extends StatefulWidget {
  const PriorityFormField({super.key, required this.onPriorityChange});
  final void Function(Priority selectedPriority) onPriorityChange;

  @override
  State<PriorityFormField> createState() => _PriorityFormFieldState();
}

class _PriorityFormFieldState extends State<PriorityFormField> {
  Priority selectedPriority = Priority.low;
  @override
  //==================================================================
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        //label --------------------------------------------------
        Row(
          children: [
            Icon(
              Icons.notification_important_rounded,
              color: Theme.of(context).colorScheme.primary,
            ),
            const SizedBox(
              width: 5,
            ),
            const Text("Priority"),
          ],
        ),
        //buttons --------------------------------------------------
        Row(
          children: [
            GestureDetector(
              onTap: () {
                setState(() {
                  selectedPriority = Priority.low;
                });
                widget.onPriorityChange(selectedPriority);
              },
              child: PriorityButton(
                  color: Theme.of(context).colorScheme.secondary,
                  isSelected: selectedPriority == Priority.low),
            ),
            const SizedBox(
              width: 30,
            ),
            GestureDetector(
              onTap: () {
                setState(() {
                  selectedPriority = Priority.medium;
                });
                widget.onPriorityChange(selectedPriority);
              },
              child: PriorityButton(
                  color: Theme.of(context).colorScheme.tertiary,
                  isSelected: selectedPriority == Priority.medium),
            ),
            const SizedBox(
              width: 30,
            ),
            GestureDetector(
              onTap: () {
                setState(() {
                  selectedPriority = Priority.high;
                });
                widget.onPriorityChange(selectedPriority);
              },
              child: PriorityButton(
                  color: Theme.of(context).colorScheme.error,
                  isSelected: selectedPriority == Priority.high),
            ),
          ],
        )
      ],
    );
  }
}

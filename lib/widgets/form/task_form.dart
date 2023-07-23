import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_app/models/todo.dart';
import 'package:todo_app/providers/todo_provider.dart';
import 'package:todo_app/widgets/form/date_picker_form_field.dart';
import 'package:todo_app/widgets/form/priority_form_field.dart';
import 'package:todo_app/widgets/form/text_field_border.dart';

import '../../providers/days_provider.dart';

class TaskForm extends ConsumerStatefulWidget {
  const TaskForm({super.key});

  @override
  ConsumerState<TaskForm> createState() => _TaskFormState();
}

class _TaskFormState extends ConsumerState<TaskForm> {
  final _title = TextEditingController();
  bool _titleValid = true;
  bool _timeRequired = false;
  DateTime _selectedTime = DateTime(
      DateTime.now().year, DateTime.now().month, DateTime.now().day, 7);
  Priority _selectedPriority = Priority.low;
  //----------------------------------------------------------------
  void _submit() {
    final data = ref.read(daysProvider);
    final List<DateTime> days = data["weekDays"];
    final int currentDayIndex = data["todayIndex"];
    final DateTime today = days[currentDayIndex];

    if (_title.text.trim().isEmpty) {
      setState(() {
        _titleValid = false;
      });
      return;
    }

    ToDo todo = ToDo(
        title: _title.text.trim(),
        isTimeRequired: _timeRequired,
        isChecked: false,
        time: DateTime(
            today.year,
            today.month,
            today.day,
            _timeRequired ? _selectedTime.hour : 0,
            _timeRequired ? _selectedTime.minute : 0),
        priority: _selectedPriority);
    ref.read(todoProvider.notifier).addTodo(todo);
    Navigator.of(context).pop();
  }

//==================================================================
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        //drag bar-----------------------------------------------------
        Container(
          width: 50,
          height: 3,
          decoration: BoxDecoration(
              color: Colors.black45, borderRadius: BorderRadius.circular(15)),
        ),
        const SizedBox(
          height: 30,
        ),
        //title-----------------------------------------------------
        TextFieldBorder(
          isValid: _titleValid,
          textFormFeild: TextFormField(
            controller: _title,
            decoration: InputDecoration(
                border: InputBorder.none,
                hintText: "What do you want to do?",
                hintStyle: TextStyle(
                    color: Theme.of(context).brightness == Brightness.dark
                        ? Colors.white24
                        : Colors.black38)),
          ),
        ),
        const SizedBox(
          height: 30,
        ),
        //time picker -----------------------------------------------------
        DatePickerFormField(
          onTimeChange: (selectedValue) {
            _selectedTime = selectedValue;
          },
          isRequiringTime: (value) {
            _timeRequired = value;
          },
        ),
        const SizedBox(
          height: 30,
        ),
        //priority picker -----------------------------------------------------
        PriorityFormField(
          onPriorityChange: (selectedPriority) {
            _selectedPriority = selectedPriority;
          },
        ),
        const SizedBox(
          height: 30,
        ),
        //submit button -----------------------------------------------------
        SizedBox(
          width: double.infinity,
          child: ElevatedButton(
            onPressed: _submit,
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(
                  Theme.of(context).colorScheme.primary),
              foregroundColor: MaterialStateProperty.all(Colors.white),
              shape: MaterialStateProperty.all(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5),
                ),
              ),
            ),
            child: const Text("Save"),
          ),
        )
      ],
    );
  }
}

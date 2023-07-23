import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:todo_app/widgets/switch_button.dart';

class DatePickerFormField extends StatefulWidget {
  const DatePickerFormField(
      {super.key, required this.onTimeChange, required this.isRequiringTime});
  final void Function(DateTime selectedValue) onTimeChange;
  final void Function(bool value) isRequiringTime;

  @override
  State<DatePickerFormField> createState() => _DatePickerFormFieldState();
}

class _DatePickerFormFieldState extends State<DatePickerFormField> {
  bool switchVal = false;
  DateTime value = DateTime(
      DateTime.now().year, DateTime.now().month, DateTime.now().day, 7);
  //==================================================================
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        //label --------------------------------------------------
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Icon(
                  Icons.timer_rounded,
                  color: Theme.of(context).colorScheme.primary,
                ),
                const SizedBox(
                  width: 5,
                ),
                Text(DateFormat.Hm().format(value)),
              ],
            ),
            //awitch --------------------------------------------------
            SwitchButton(
              value: switchVal,
              onChanged: (value) {
                setState(() {
                  switchVal = value;
                });
                widget.isRequiringTime(value);
              },
            )
          ],
        ),
        const SizedBox(
          height: 30,
        ),
        //time picker --------------------------------------------------
        SizedBox(
          height: 150,
          child: CupertinoDatePicker(
            onDateTimeChanged: (value) {
              setState(() {
                this.value = value;
              });
              widget.onTimeChange(value);
            },
            mode: CupertinoDatePickerMode.time,
            use24hFormat: false,
            initialDateTime: value,
          ),
        ),
      ],
    );
  }
}

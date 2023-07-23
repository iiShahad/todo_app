import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DateItem extends StatelessWidget {
  const DateItem({super.key, required this.isToday, required this.date});
  final bool isToday;
  final DateTime date;
  //==================================================================
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: 50,
      decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: isToday
              ? Theme.of(context).colorScheme.primary.withOpacity(0.3)
              : Colors.transparent),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(DateFormat.E().format(date)),
          Text(date.day.toString()),
        ],
      ),
    );
  }
}

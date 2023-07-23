import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_app/providers/days_provider.dart';
import 'package:todo_app/widgets/dates/date_item.dart';

class DatesList extends ConsumerWidget {
  const DatesList({super.key});
  //==================================================================
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final data = ref.watch(daysProvider);
    final List<DateTime> days = data["weekDays"];
    final int currentDay = data["todayIndex"];
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: days
          .map((e) => GestureDetector(
                onTap: () {
                  ref
                      .read(daysProvider.notifier)
                      .changeSelectedDay(days.indexOf(e));
                },
                child: DateItem(
                  isToday: days.indexOf(e) == currentDay,
                  date: e,
                ),
              ))
          .toList(),
    );
  }
}

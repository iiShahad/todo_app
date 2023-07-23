import 'package:flutter_riverpod/flutter_riverpod.dart';

class Days extends StateNotifier<Map<String, dynamic>> {
  Days() : super({}) {
    final List<DateTime> daysOfWeek = <DateTime>[];
    int currentDay = -1; //index of today
    //in dart days are arranges in this order: [mon, tue, wed, thu, fri, sat, sun] notice that sunday is at index 6 which means it will have value of 7
    DateTime now = DateTime.now();
    currentDay = now.weekday; //this will give me the index of today
    DateTime sunday =
        now; //lets demonstrate that today is actually sunday, if so, it will generate the next days of the week
    if (currentDay != 7) {
      sunday = now.subtract(Duration(
          days:
              currentDay)); //if today is not sunday, we will look for the date of the last sunday
    } else {
      currentDay =
          0; //if today is sunday, sunday should be at the start of the list and it has index 7, so I will change it to 0
      //0=> sun, 1 => mon , 2 => tue, 3=> wed ....
    }

    //fill the array with week days starting from sunday
    for (int i = 0; i < 7; i++) {
      daysOfWeek.add(sunday.add(Duration(days: i)));
    }

    //return a map
    state = {
      "weekDays": daysOfWeek,
      "todayIndex": currentDay,
    };
  }

  void changeSelectedDay(int index) {
    final data = {...state};
    data["todayIndex"] = index;
    state = data;
  }
}

final daysProvider =
    StateNotifierProvider<Days, Map<String, dynamic>>((ref) => Days());

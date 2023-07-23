enum Priority {
  high,
  medium,
  low,
}

class ToDo {
  final String title;
  final DateTime time;
  final Priority priority;
  final bool isTimeRequired;
  bool isChecked;

  ToDo(
      {required this.title,
      required this.time,
      required this.priority,
      required this.isTimeRequired,
      required this.isChecked});
}

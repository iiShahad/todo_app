import 'package:flutter/material.dart';

class PriorityButton extends StatelessWidget {
  const PriorityButton(
      {super.key, required this.color, required this.isSelected});
  final Color color;
  final bool isSelected;
  //==================================================================
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 30,
      width: 30,
      decoration: BoxDecoration(
          border: Border.all(color: isSelected ? color : Colors.transparent),
          color: isSelected ? color.withOpacity(0.2) : null,
          shape: BoxShape.circle),
      child: Center(
        child: Container(
          height: 15,
          width: 15,
          decoration: BoxDecoration(color: color, shape: BoxShape.circle),
        ),
      ),
    );
  }
}

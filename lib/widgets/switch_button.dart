import 'package:flutter/material.dart';

class SwitchButton extends StatelessWidget {
  const SwitchButton({super.key, required this.value, required this.onChanged});
  final void Function(bool value) onChanged;
  final bool value;
//==================================================================
  @override
  Widget build(BuildContext context) {
    return Switch(
      value: value,
      inactiveThumbColor: Theme.of(context).brightness == Brightness.dark
          ? Colors.white24
          : Colors.black26,
      trackOutlineColor: MaterialStateProperty.all(
          Theme.of(context).brightness == Brightness.dark
              ? Colors.white24
              : Colors.black26),
      onChanged: (value) => onChanged(value),
    );
  }
}

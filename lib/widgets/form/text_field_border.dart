import 'package:flutter/material.dart';

class TextFieldBorder extends StatelessWidget {
  const TextFieldBorder(
      {super.key, required this.textFormFeild, required this.isValid});
  final TextFormField textFormFeild;
  final bool isValid;
  @override
  Widget build(BuildContext context) {
    //==================================================================
    return Container(
      height: 50,
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.background,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
            color: isValid
                ? Theme.of(context).colorScheme.primary
                : Theme.of(context).colorScheme.error),
      ),
      child: Padding(
        padding: const EdgeInsets.only(left: 8, right: 8, bottom: 2),
        child: textFormFeild,
      ),
    );
  }
}

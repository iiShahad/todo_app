import 'package:flutter/material.dart';
import 'package:todo_app/views/home.dart';
import 'package:todo_app/views/settings.dart';

class DrawerContent extends StatelessWidget {
  const DrawerContent({super.key});
//==================================================================
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ListTile(
          leading: const Icon(Icons.home),
          title: const Text('Home'),
          onTap: () {
            Navigator.of(context).pushReplacement(MaterialPageRoute(
              builder: (context) => const Home(),
            ));
          },
        ),
        ListTile(
          leading: const Icon(Icons.settings),
          title: const Text('Settings'),
          onTap: () {
            Navigator.of(context).pushReplacement(MaterialPageRoute(
              builder: (context) => const Settings(),
            ));
          },
        ),
      ],
    );
  }
}

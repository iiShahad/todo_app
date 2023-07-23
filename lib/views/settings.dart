import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_app/providers/theme_provider.dart';
import 'package:todo_app/widgets/switch_button.dart';

import '../widgets/drawer_content.dart';

class Settings extends ConsumerStatefulWidget {
  const Settings({super.key});

  @override
  ConsumerState<Settings> createState() => _SettingsState();
}

class _SettingsState extends ConsumerState<Settings> {
  final items = ["Light", "Dark"];
  String selectedVal = "Light";
  bool switchVal = true;

  void whenChangingValueDropDown(String value) {
    if (value == items[0]) {
      ref.read(themeProvider.notifier).state = ThemeMode.light;
      setState(() {
        selectedVal = value;
      });
    } else {
      ref.read(themeProvider.notifier).state = ThemeMode.dark;
      setState(() {
        selectedVal = value;
      });
    }
  }

  //=========================================================
  @override
  Widget build(BuildContext context) {
    switchVal = ref.read(themeProvider) == ThemeMode.system;
    return Scaffold(
      //app bar ---------------------------------------
      drawer: const Drawer(child: DrawerContent()),
      appBar: AppBar(
        title: const Text(
          "Settings",
          style: TextStyle(fontSize: 30, fontWeight: FontWeight.w700),
        ),
      ),
      //content ---------------------------------------
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text("Theme"),
            //system theme switch ----------------------------------
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text("Use system theme"),
                SwitchButton(
                  value: switchVal,
                  onChanged: (value) {
                    setState(() {
                      switchVal = !switchVal;
                    });
                    if (!switchVal) {
                      ref.read(themeProvider.notifier).state = ThemeMode.light;
                    } else {
                      ref.read(themeProvider.notifier).state = ThemeMode.system;
                    }
                  },
                ),
              ],
            ),
            //if not using system theme ----------------------------------
            !switchVal
                ? Expanded(
                    child: Column(
                      children: [
                        const Divider(),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text("Theme mode"),
                            DropdownButton(
                              elevation: 5,
                              dropdownColor: Theme.of(context).brightness ==
                                      Brightness.dark
                                  ? Colors.grey[900]
                                  : Colors.grey[200],
                              value: selectedVal,
                              items: items.map((String items) {
                                return DropdownMenuItem(
                                  value: items,
                                  child: Text(items),
                                );
                              }).toList(),
                              onChanged: (value) =>
                                  whenChangingValueDropDown(value!),
                            )
                          ],
                        )
                      ],
                    ),
                  )
                : const SizedBox(),
          ],
        ),
      ),
    );
  }
}

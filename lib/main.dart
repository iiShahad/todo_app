import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_app/providers/theme_provider.dart';
import 'package:todo_app/views/home.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

const ColorScheme lightMode = ColorScheme.light(
  primary: Color(0xff8280ff),
  secondary: Color(0xff4ad991),
  tertiary: Color(0xffffca83),
  error: Color(0xffff7285),
);
const ColorScheme darkMode = ColorScheme.dark(
  primary: Color(0xff8280ff),
  secondary: Color(0xff4ad991),
  tertiary: Color(0xffffca83),
  error: Color(0xffff7285),
);

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp(
      title: 'Todo app',
      debugShowCheckedModeBanner: false,
      themeMode: ref.watch(themeProvider),
      theme: ThemeData(
          colorScheme: lightMode,
          useMaterial3: true,
          brightness: Brightness.light),
      darkTheme: ThemeData(
          colorScheme: darkMode,
          useMaterial3: true,
          brightness: Brightness.dark),
      home: const Home(),
    );
  }
}

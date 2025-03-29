import 'package:flutter/material.dart';
import 'util.dart';
import 'theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme =
        createTextTheme(context, "Montserrat", "Montserrat Alternates");
    MaterialTheme theme = MaterialTheme(textTheme);

    return MaterialApp(
      title: 'Restaurant App',
      theme: theme.light(),
      darkTheme: theme.dark(),
      themeMode: ThemeMode.system,
      home: const SizedBox(),
    );
  }
}

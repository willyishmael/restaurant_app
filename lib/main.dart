import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:restaurant_app/navigation/routes.dart';
import 'package:restaurant_app/provider/restaurant_detail_provider.dart';
import 'package:restaurant_app/provider/restaurant_list_provider.dart';
import 'package:restaurant_app/screen/home_screen.dart';
import 'util.dart';
import 'theme.dart';

void main() {
  var providers = [
    ChangeNotifierProvider(create: (_) => RestaurantListProvider()),
    ChangeNotifierProvider(create: (_) => RestaurantDetailProvider()),
  ];

  runApp(MultiProvider(
    providers: providers,
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = createTextTheme(
      context,
      "Montserrat",
      "Montserrat Alternates",
    );

    MaterialTheme theme = MaterialTheme(textTheme);

    return MaterialApp(
      title: 'Restaurant App',
      theme: theme.light(),
      darkTheme: theme.dark(),
      themeMode: ThemeMode.system,
      initialRoute: Routes.home.name,
      routes: {
        Routes.home.name: (context) => const HomeScreen(),
        Routes.detail.name: (context) => const HomeScreen(),
      },
    );
  }
}

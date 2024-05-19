import 'package:flutter/material.dart';
import 'package:world_clock/pages/home_page.dart';
import 'package:world_clock/pages/loading.dart';
import 'package:world_clock/pages/locations.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => Loading(),
        '/home': (context) => HomePage()

      },
    );
  }
}

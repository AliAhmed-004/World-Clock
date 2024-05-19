import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:world_clock/pages/locations.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  Color appbarColor = Colors.amber;
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      drawer: Locations(),
    );
  }
}
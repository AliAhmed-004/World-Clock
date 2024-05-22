import 'package:flutter/material.dart';
import 'package:world_clock/pages/locations.dart';

class HomePage extends StatefulWidget {
  HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Map data = {};

  // recieving data sent by loading.dart
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final args = ModalRoute.of(context)?.settings.arguments;    

    if(args != null && args is Map) {
      setState(() {
        data = args;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      drawer: Locations(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(data['location']),
            Text(data['time']),
            Text(data['flag']),
          ],
        ),
      ),
    );
  }
}

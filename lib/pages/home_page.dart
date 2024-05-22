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

    if (args != null && args is Map) {
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
      body: SafeArea(
        child: Center(
          child: Padding(
            // TODO: Change this according to the background image
            padding: const EdgeInsets.fromLTRB(10, 0, 20, 10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  data['flag'],
                ),
                const SizedBox(
                  height: 20,
                ),
                    
                // Location
                Text(
                  data['location'],
                  style: const TextStyle(fontSize: 20, letterSpacing: 2),
                ),
                const SizedBox(
                  height: 20,
                ),
                    
                // Actual Time
                Text(
                  data['time'],
                  style: TextStyle(fontSize: 35, letterSpacing: 2, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

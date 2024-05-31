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

  // set background

  @override
  Widget build(BuildContext context) {
    String bgImage = data['isDayTime'] ? 'Day.png' : 'Night.png';
    return Scaffold(
        body: SafeArea(
            child: Container(
      decoration: BoxDecoration(
        image: DecorationImage(image: AssetImage(bgImage), fit: BoxFit.cover),
      ),
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                data['flag'],
              ),
              const SizedBox(
                height: 10,
              ),

              // Location
              Text(
                data['location'],
                style: const TextStyle(
                    fontSize: 35,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 2),
              ),
              const SizedBox(
                height: 10,
              ),

              // Actual Time
              Text(
                data['time'],
                style: const TextStyle(
                    fontSize: 35,
                    letterSpacing: 2,
                    fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
      ),
    )));
  }
}

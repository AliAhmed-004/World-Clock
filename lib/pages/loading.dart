import 'package:flutter/material.dart';
import 'package:world_clock/services/GetTime.dart';

class Loading extends StatefulWidget {
  const Loading({super.key});

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {

  String? time = 'Loading...';

  void setupWorldTime() async {
    WorldTime instance = new WorldTime(location: 'Berlin', flag: 'germany.png', url: 'Europe/Berlin');
    await instance.getTime();

    setState(() {
      time = instance.time;
    });
  }

  @override
  void initState() {
    super.initState();
    setupWorldTime();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(25),
      child: Text(
        time!,
        style: TextStyle(
          fontSize: 15,
          decoration: TextDecoration.none,
          color: Colors.black
        ),
      ),
    );
  }
}
import 'package:flutter/material.dart';
import 'package:world_clock/services/GetTime.dart';

class Loading extends StatefulWidget {
  const Loading({super.key});

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {

  void setupWorldTime() async {
    WorldTime instance = new WorldTime(location: 'Karachi', flag: 'pakistan.png', url: 'Asia/Karachi');
    await instance.getTime();

    // sending data to home_screen
    Navigator.pushReplacementNamed(context, '/home', arguments: {
      'location': instance.location,
      'time': instance.time,
      'flag': instance.flag
    });
  }

  @override
  void initState() {
    super.initState();
    setupWorldTime();
  }

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(25),
      child: Text(
        'Loading...',
        style: TextStyle(
          fontSize: 15,
          decoration: TextDecoration.none,
          color: Colors.black
        ),
      ),
    );
  }
}
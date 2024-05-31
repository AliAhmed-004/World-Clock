import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:world_clock/services/world_time.dart';

class Loading extends StatefulWidget {
  const Loading({super.key});

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {

  void setupWorldTime() async {
    try{
    WorldTime instance = new WorldTime(location: 'Karachi', flag: 'pakistan.png', url: 'Asia/Karachi');
    await instance.getTime();


    // sending data to home_screen
    // TODO: Fix the bug related to the RSOD of loading.dart
    if (instance.location != null && instance.time != null && instance.flag != null) {
        Navigator.pushNamedAndRemoveUntil(context, '/home', (route) => false, arguments: {
          'location': instance.location,
          'time': instance.time,
          'flag': instance.flag,
          'isDayTime': instance.isDayTime
        });
      } else {
        print('Error: One or more values are null');
      }
    } catch (e) {
      print("Error caught: $e");
    }
  }

  @override
  void initState() {
    super.initState();
    setupWorldTime();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        body: Center(
          child: SpinKitThreeBounce(
            color: Colors.amber,
          ),
        ),
      );
  }
}
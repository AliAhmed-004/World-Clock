import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'dart:convert';

class Loading extends StatefulWidget {
  const Loading({super.key});

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  
  // making request to fetch the time
  void getTime() async {
    Response response = await get(Uri.parse('http://worldtimeapi.org/api/timezone/Asia/Karachi'));

    Map timeData = jsonDecode(response.body);

    // getting properties from the data
    String dateTime = timeData['datetime'];
    String offset = timeData['utc_offset'].substring(1, 3);

    // print(dateTime);
    // print(offset);

    // creating DateTime object
    DateTime now = DateTime.parse(dateTime);

    now = now.add(Duration(hours: int.parse(offset)));

    print(now);
  }

  @override
  void initState() {
    super.initState();
    getTime();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Text("Loading Screen"),
    );
  }
}
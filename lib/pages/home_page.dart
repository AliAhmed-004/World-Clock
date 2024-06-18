import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Map data = {};

  // recieving data sent by loading.dart
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  // set background

  @override
  Widget build(BuildContext context) {
    data = data.isNotEmpty
        ? data
        : ModalRoute.of(context)?.settings.arguments as Map;

    String bgImage = (data['isDayTime']) ? 'Day.png' : 'Night.png';
    Color fontColor = data['isDayTime']
        ? const Color.fromARGB(255, 43, 43, 43)
        : Color.fromARGB(255, 229, 229, 229);
        Color iconColor = data['isDayTime']
        ? const Color.fromARGB(255, 43, 43, 43)
        : Color.fromARGB(255, 229, 229, 229);

    String flagImage = data['flag'];

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
              // Flag
              CircleAvatar(
                radius: 50,
                backgroundImage: AssetImage(flagImage),
              ),
              const SizedBox(
                height: 10,
              ),

              // Location
              Text(
                data['location'],
                style: TextStyle(
                    color: fontColor,
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
                style: TextStyle(
                  color: fontColor,
                    fontSize: 35,
                    letterSpacing: 2,
                    fontWeight: FontWeight.bold),
              ),

              const SizedBox(
                height: 30,
              ),
              // Change Location Button
              TextButton.icon(
                onPressed: () async {
                  dynamic result =
                      await Navigator.pushNamed(context, '/locations');
                  setState(() {
                    data = {
                      'time': result['time'],
                      'location': result['location'],
                      'flag': result['flag'],
                      'isDatTime': result['isDayTime'],
                    };
                  });
                },
                label: Text(
                  'Edit Location',
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: fontColor),
                ),
                icon: Icon(
                  Icons.location_on_outlined,
                  color: iconColor,
                ),
              ),
            ],
          ),
        ),
      ),
    )));
  }
}

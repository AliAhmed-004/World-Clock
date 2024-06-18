import 'package:flutter/material.dart';
import 'package:world_clock/services/world_time.dart';

// ignore: must_be_immutable
class Locations extends StatelessWidget {
  List<WorldTime> locations = [
	    WorldTime(url: 'Asia/Karachi', location: 'Karachi', flag: 'pakistan.png'),
	    WorldTime(url: 'Europe/London', location: 'London', flag: 'uk.png'),
	    WorldTime(url: 'Europe/Athens', location: 'Athens', flag: 'greece.png'),
	    WorldTime(url: 'Africa/Cairo', location: 'Cairo', flag: 'egypt.png'),
	    WorldTime(url: 'Africa/Nairobi', location: 'Nairobi', flag: 'kenya.png'),
	    WorldTime(url: 'America/Chicago', location: 'Chicago', flag: 'usa.png'),
	    WorldTime(url: 'America/New_York', location: 'New York', flag: 'usa.png'),
	    WorldTime(url: 'Asia/Seoul', location: 'Seoul', flag: 'south_korea.png'),
	    WorldTime(url: 'Asia/Jakarta', location: 'Jakarta', flag: 'indonesia.png'),
	  ];

  void updateTime(context, index) async {
    WorldTime instance = locations[index];
    await instance.getTime();

    // navigate to home screen
    Navigator.pop(context, {
      'location': instance.location,
      'time': instance.time,
      'flag': instance.flag,
      'isDayTime': instance.isDayTime
    });
  }
  Locations({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Choose a Location"),
      ),
      body: ListView.builder(
        padding: EdgeInsets.all(15),
        itemCount: locations.length,
        itemBuilder: (context, index) {
          return Card(
            child: ListTile(
              onTap: (){
                updateTime(context, index);
              },
              title: Text(locations[index].location?? ''),
              leading: CircleAvatar(
                backgroundImage: AssetImage(locations[index].flag?? ''),
              ),
            ),
          );
        },
      ),
    );
  }
}

import 'package:flutter/material.dart';

class Locations extends StatelessWidget {
  List locations = [
    "Islamabad",
    "Karachi",
    "New York",
    "London",
    "Chicago",
  ];

  Locations({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView.builder(
        padding: EdgeInsets.all(15),
        itemCount: locations.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(locations[index]),
            onTap: () {
              // Handle the tap event here
              // For example, navigate to a new screen or update the time display
              Navigator.pop(context); // Close the drawer
            },
          );
        },
      ),
    );
  }
}

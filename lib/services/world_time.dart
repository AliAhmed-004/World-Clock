import 'package:http/http.dart';
import 'dart:convert';

import 'package:intl/intl.dart';

class WorldTime {
  // location name for UI
  String? location;

  // time for the location
  String? time;

  // flag for the location
  String? flag;

  // url for the request
  String? url;

  // check if its daytime or not
  bool? isDayTime;

  // constructor
  WorldTime({this.location, this.url, this.flag});

  // making request to fetch the time
  Future<void> getTime() async {
    try {
      // Making the HTTP GET request
      Response response = await get(Uri.parse('http://worldtimeapi.org/api/timezone/$url'));

      // Check if the request was successful
      if (response.statusCode == 200) {
        // Parsing the response body
        Map timeData = jsonDecode(response.body);

        // Getting properties from the data
        String dateTime = timeData['datetime'];
        String offset = timeData['utc_offset'].substring(1, 3);

        // Creating DateTime object
        DateTime now = DateTime.parse(dateTime);

        now = now.add(Duration(hours: int.parse(offset)));

        // Setting isDayTime property
        isDayTime = now.hour > 6 && now.hour < 19 ? true : false;

        // Setting the time attribute to use in the UI
        // Formatting the date to a readable format
        time = DateFormat.jm().format(now);


      } else {
        // If the server did not return a 200 OK response,
        // then throw an exception.
        throw Exception('Failed to load time data');
      }
    } catch (e) {
      // If an error occurs, set the time to an error message
      print('Caught error: $e');
      time = 'Could not get time data';
    }
  }
}

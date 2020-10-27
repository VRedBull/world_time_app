import 'package:flutter/material.dart';
import 'package:world_time_app/services/world_time.dart';

class Location extends StatefulWidget {
  @override
  _LocationState createState() => _LocationState();
}

class _LocationState extends State<Location> {
  int count = 0;

  List<WorldTime> locations = [
    WorldTime(url: 'Europe/London', location: 'London', flag: 'uk.png'),
    WorldTime(url: 'Europe/Athens', location: 'Athens', flag: 'greece.png'),
    WorldTime(url: 'Africa/Cairo', location: 'Cairo', flag: 'egypt.png'),
    WorldTime(url: 'Africa/Nairobi', location: 'Nairobi', flag: 'kenya.jpg'),
    WorldTime(url: 'America/New_York', location: 'New York', flag: 'usa.png'),
    WorldTime(url: 'Asia/Seoul', location: 'Seoul', flag: 'south_korea.png'),
    WorldTime(url: 'Asia/Kolkata', location: 'Banglore', flag: 'india.png'),
    WorldTime(url: 'America/Chicago', location: 'Chicago', flag: 'usa.png'),
    WorldTime(
        url: 'America/Rio_Branco', location: 'Brazil', flag: 'brazil.png'),
    WorldTime(
        url: 'Asia/Colombo', location: 'Sri Lanka', flag: 'sri_lanka.png'),
    WorldTime(
        url: 'Asia/Dhaka', location: 'Bangladesh', flag: 'bangladesh.jpg'),
    WorldTime(
        url: 'Asia/Kuala_Lumpur', location: 'Malaysia', flag: 'malaysia.png'),
  ];

  void updateTime(index) async {
    WorldTime instance = locations[index];
    await instance.getTime();
    //Navigate to homeScreen
    Navigator.pop(context, {
      'location': instance.location,
      'flag': instance.flag,
      'time': instance.time,
      'isDayTime': instance.isDayTime,
    });
  }

  @override
  Widget build(BuildContext context) {
    print('build method ran');

    return Scaffold(
        appBar: AppBar(
          //The appbar will automatically create an icon to go back to the home screen
          backgroundColor: Colors.teal,
          title: Text('Choose Location'),
          centerTitle: true,
        ),
        body: ListView.builder(
          itemCount: locations.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 1, horizontal: 4),
              child: Card(
                child: ListTile(
                  onTap: () {
                    updateTime(index);
                  },
                  title: Text(locations[index].location),
                  leading: CircleAvatar(
                    backgroundImage:
                        AssetImage('assets/${locations[index].flag}'),
                  ),
                ),
              ),
            );
          },
        ));
  }
}

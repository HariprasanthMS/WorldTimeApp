import 'package:flutter/material.dart';
import 'package:world_time/services/world_time.dart';

class ChooseLocation extends StatefulWidget {
  @override
  _ChooseLocationState createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {
  List<WorldTime> locations = [
    WorldTime(url: 'Europe/London', location: 'London', flag: 'uk.png'),
    WorldTime(url: 'Europe/Berlin', location: 'Athens', flag: 'uk.png'),
    WorldTime(url: 'Africa/Cairo', location: 'Cairo', flag: 'uk.png'),
    WorldTime(url: 'Africa/Nairobi', location: 'Nairobi', flag: 'uk.png'),
    WorldTime(url: 'America/Chicago', location: 'Chicago', flag: 'uk.png'),
    WorldTime(url: 'Europe/London', location: 'London', flag: 'uk.png'),
    WorldTime(url: 'Europe/London', location: 'London', flag: 'uk.png'),
    WorldTime(url: 'Asia/Kolkata', location: 'India', flag: 'india.png'),
  ];

  void updateTime(index) async {
    WorldTime countryTime = WorldTime(
        location: locations[index].location,
        flag: locations[index].flag,
        url: locations[index].url);
    await countryTime.getTime();
    Navigator.pop(context, {
      'location': countryTime.location,
      'flag': countryTime.flag,
      'time': countryTime.time,
      'isDayTime': countryTime.isDayTime,
    });
  }

  @override
  Widget build(BuildContext context) {
    print('Build ran');
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Colors.blue[900],
        title: Text('Choose a Location'),
        centerTitle: true,
        elevation: 0,
      ),
      body: ListView.builder(
        itemCount: locations.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5.0, vertical: 1.0),
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
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:world_time/services/world_time.dart';

class ChooseLocation extends StatefulWidget {
  @override
  _ChooseLocationState createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {
  List<WorldTime> locations = [
    WorldTime(location: 'Chicago', flag: 'chicago.jpg', url: 'America/Chicago'),
    WorldTime(
        location: 'Los_Angeles',
        flag: 'Los-Angeles.jpg',
        url: 'America/Los_Angeles'),
    WorldTime(
        location: 'Mexico_City',
        flag: 'mexico_city.jpg',
        url: 'America/Mexico_City'),
    WorldTime(
        location: 'New_York', flag: 'New_york.jpg', url: 'America/New_York'),
    WorldTime(location: 'Toronto', flag: 'toronto.jpg', url: 'America/Toronto'),
    WorldTime(location: 'Colombo', flag: 'Colombo.jpg', url: 'Asia/Colombo'),
    WorldTime(
        location: 'Hồ Chí Minh',
        flag: 'Ho-Chi-Minh-City-1.jpg',
        url: 'Asia/Ho_Chi_Minh'),
    WorldTime(location: 'Macau', flag: 'macau.jpg', url: 'Asia/Macau'),
  ];

  void updateTime(index) async{
    WorldTime instance = locations[index];
    await instance.getTime();
    // navigate to home screen
    Navigator.pop(context,{
      'location': instance.location,
      'time': instance.time,
      'flag': instance.flag,
      'isDatetime': instance.isDatetime,
    });
  }

//wiget tree
  @override
  Widget build(BuildContext context) {
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
              padding: const EdgeInsets.symmetric(vertical: 1.0,horizontal: 4.0),
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
          }),
    );
  }
}

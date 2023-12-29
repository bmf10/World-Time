import 'package:flutter/material.dart';
import 'package:world_time/services/word_time.dart';

class ChooseLocation extends StatefulWidget {
  const ChooseLocation({super.key});

  @override
  State<ChooseLocation> createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {
  @override
  void initState() {
    super.initState();
  }

  List<WorldTime> locations = [
    WorldTime(url: 'Europe/London', location: 'London', flag: 'uk.png'),
    WorldTime(url: 'Europe/Berlin', location: 'Athens', flag: 'greece.png'),
    WorldTime(url: 'Africa/Cairo', location: 'Cairo', flag: 'egypt.png'),
    WorldTime(url: 'Africa/Nairobi', location: 'Nairobi', flag: 'kenya.png'),
    WorldTime(url: 'America/Chicago', location: 'Chicago', flag: 'usa.png'),
    WorldTime(url: 'America/New_York', location: 'New York', flag: 'usa.png'),
    WorldTime(url: 'Asia/Seoul', location: 'Seoul', flag: 'south_korea.png'),
    WorldTime(url: 'Asia/Jakarta', location: 'Jakarta', flag: 'indonesia.png'),
  ];

  void handleTap(int index) async {
    WorldTime instance = locations[index];
    await instance.getTime();
    if (context.mounted) {
      Navigator.pop(context, {
        'location': instance.location,
        'flag': instance.flag,
        'time': instance.time,
        'isDayTime': instance.isDayTime
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Choose Locations'),
        backgroundColor: Colors.amber,
      ),
      body: Container(
        color: Colors.grey[50],
        padding: const EdgeInsets.symmetric(vertical: 1, horizontal: 4),
        child: ListView.builder(
          itemCount: locations.length,
          itemBuilder: (context, index) {
            return Card(
                child: ListTile(
              onTap: () => handleTap(index),
              title: Text(locations[index].location),
              leading: CircleAvatar(
                  backgroundImage:
                      AssetImage('assets/${locations[index].flag}')),
              tileColor: Colors.amberAccent[100],
            ));
          },
        ),
      ),
    );
  }
}

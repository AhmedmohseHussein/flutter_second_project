import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:jiffy/jiffy.dart';

class TimePage extends StatelessWidget {
  DateTime dateOne = DateTime.now().add(Duration(days: 10));
  DateTime dateTwo = DateTime.now().subtract(Duration(hours: 1));
  DateTime dateThree = DateTime.now().subtract(Duration(days: 10));

  @override
  Widget build(BuildContext context) {
    return GridView(
      gridDelegate:
          SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 1),
      children: [
        ElevatedButton(
            style: ElevatedButton.styleFrom(padding: EdgeInsets.all(20)),
            onPressed: () async {
              print(DateTime.now().subtract(Duration(days: 10)));
              print(DateTime.now());
              print(DateTime.now()
                  .add(Duration(days: 10, seconds: 20, hours: 10)));
              print(dateOne.isBefore(dateTwo));
              print(dateOne.isAfter(dateTwo));
              print(dateOne.isAtSameMomentAs(dateTwo));
            },
            child: const Text('get date and time')),
        ElevatedButton(
            style: ElevatedButton.styleFrom(padding: EdgeInsets.all(20)),
            onPressed: () async {
              print(Jiffy.parseFromDateTime(dateTwo).EEEE);
              print(Jiffy.parseFromDateTime(dateTwo).fromNow());
              print(Jiffy.parseFromDateTime(dateTwo).format(pattern: 'MMMM'));

              Jiffy;
            },
            child: const Text('get Time format')),
      ],
    );
  }
}

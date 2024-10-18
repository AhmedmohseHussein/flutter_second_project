import 'package:dropdown_search/dropdown_search.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:jiffy/jiffy.dart';
import 'package:http/http.dart';
import 'dart:convert';

changeLocal() async {
  await Jiffy.setLocale('ar');
}

class LocationPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Location'),
        backgroundColor: Theme.of(context).primaryColor,
      ),
      drawer: Drawer(),
      body: Container(
        width: double.infinity,
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                margin: EdgeInsets.all(20),
                padding: EdgeInsets.all(10),
                child: ElevatedButton(
                    style:
                        ElevatedButton.styleFrom(padding: EdgeInsets.all(20)),
                    onPressed: () async {
                      Position cl = await getLatAndLong();
                      print(cl.latitude);
                      print(cl.longitude);
                    },
                    child: const Text('get latitude and lonigtude')),
              ),
              Container(
                margin: EdgeInsets.all(20),
                padding: EdgeInsets.all(10),
                child: ElevatedButton(
                    style:
                        ElevatedButton.styleFrom(padding: EdgeInsets.all(20)),
                    onPressed: () async {
                      var distanceBetween = Geolocator.distanceBetween(
                          24.327077, 39.631053, 27.547242, 41.741836);
                      var distanceKM = distanceBetween / 1000;
                      print(distanceBetween);
                    },
                    child: const Text('get distanceBetween')),
              ),
              Container(
                margin: EdgeInsets.all(20),
                padding: EdgeInsets.all(10),
                child: ElevatedButton(
                    style:
                        ElevatedButton.styleFrom(padding: EdgeInsets.all(20)),
                    onPressed: () async {
                      // List<Placemark> placemark =
                      //     await placemarkFromCoordinates(52.2165157, 6.9437819);
                      // List<Placemark> placemarks =
                      //     await placemarkFromCoordinates(52.2165157, 6.9437819);
                      List<Location> locations = await locationFromAddress(
                          "Gronausestraat 710, Enschede");
                      // print(placemarks[0].country);
                      print(locations);

                      // 30.0899836,31.2936935,52.2165157, 6.9437819
                    },
                    child: const Text('get Placemark')),
              ),
              Container(
                margin: EdgeInsets.all(20),
                padding: EdgeInsets.all(10),
                child: ElevatedButton(
                    style:
                        ElevatedButton.styleFrom(padding: EdgeInsets.all(20)),
                    onPressed: () async {
                      getPosition();
                    },
                    child: const Text('get Services')),
              ),
            ]),
      ),
    );
  }

  Future getPosition() async {
    bool services = false;

    services = await Geolocator.isLocationServiceEnabled();

    print(services);

    LocationPermission per = LocationPermission.always;

    per = await Geolocator.checkPermission();
    print(per);

    if (per == LocationPermission.denied) {
      per = await Geolocator.requestPermission();
    }

    // if (per == LocationPermission.whileInUse) {
    //   print(getLatAndLong());
    // }
  }

  Future<Position> getLatAndLong() async {
    return await Geolocator.getCurrentPosition()
        .then((Position value) => value);
  }
}

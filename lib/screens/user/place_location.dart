import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart' as latLng;

class PlaceLocation extends StatefulWidget {
  String latitude;
  String longitude;
  PlaceLocation({
    required this.latitude,
    required this.longitude,
  });

  @override
  State<PlaceLocation> createState() => _PlaceLocationState();
}

class _PlaceLocationState extends State<PlaceLocation> {
  @override
  Widget build(BuildContext context) {
    double lat = double.parse(widget.latitude);
     double long = double.parse(widget.longitude);
    return Scaffold(
      body: FlutterMap(
        options: MapOptions(
          zoom: 13,
          center: latLng.LatLng(lat,long),
        ),
        children: [
          TileLayer(
            urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
            userAgentPackageName: 'com.example.app',
          ),
          MarkerLayer(
            markers: [
              Marker(
                  builder: (BuildContext context) => new Container(
                        child: IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.location_on,
                            color: Colors.red,
                            size: 40,
                          ),
                        ),
                      ),
                  point: latLng.LatLng(lat, long))
            ],
          )
        ],
      ),
    );
  }
}

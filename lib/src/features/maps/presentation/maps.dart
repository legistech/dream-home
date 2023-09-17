import 'package:dream_home/src/features/maps/data/location_util.dart';
import 'package:dream_home/src/features/maps/presentation/widgets/location_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

class Maps extends StatefulWidget {
  const Maps({Key? key}) : super(key: key);

  @override
  State<Maps> createState() => _MapsState();
}

class _MapsState extends State<Maps> {
  late Location liveLocation;
  String locationDetails = 'Loading...';

  @override
  void initState() {
    super.initState();
    liveLocation = Location();
    _fetchLocationDetails();
  }

  Future<void> _fetchLocationDetails() async {
    final details = await liveLocation.getLiveLocationDetails();

    setState(() {
      locationDetails = details ?? 'Location details are not available';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<String?>(
        future: liveLocation.getLiveLocationDetails(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            // Handle the error more gracefully here
            return Center(child: Text('Error: ${snapshot.error}'));
          } else {
            // Check if location details are available
            final details = snapshot.data;
            if (details == null || details.isEmpty) {
              return const Center(
                  child: Text('Location details are not available'));
            } else {
              // Location details are available, display them
              return FlutterMap(
                options: MapOptions(
                  center: liveLocation.currentLocation != null
                      ? LatLng(
                          liveLocation.currentLocation!.latitude,
                          liveLocation.currentLocation!.longitude,
                        )
                      : const LatLng(21, 87), // Default to a fixed location
                  zoom: 10.0,
                ),
                children: [
                  TileLayer(
                    urlTemplate:
                        "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
                    subdomains: const ['a', 'b', 'c'],
                  ),
                  MarkerLayer(
                    markers: liveLocation.currentLocation != null
                        ? [
                            Marker(
                              width: 20.0, // Adjust as needed
                              height: 20.0, // Adjust as needed
                              point: LatLng(
                                liveLocation.currentLocation!.latitude,
                                liveLocation.currentLocation!.longitude,
                              ),
                              builder: (context) => const LocationIndicator(),
                            ),
                          ]
                        : [],
                  ),
                ],
              );
            }
          }
        },
      ),
    );
  }
}

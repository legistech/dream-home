import 'package:dream_home/src/features/maps/data/location_util.dart';
import 'package:flutter/material.dart';

class LocationDisplay extends StatefulWidget {
  final Function(String) onLocationChanged; // Callback function

  const LocationDisplay({Key? key, required this.onLocationChanged})
      : super(key: key);

  @override
  State<LocationDisplay> createState() => _LocationDisplayState();
}

class _LocationDisplayState extends State<LocationDisplay> {
  late Location liveLocation;

  @override
  void initState() {
    super.initState();
    liveLocation = Location();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: FutureBuilder<String?>(
          future: liveLocation.getLiveLocationDetails(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const CircularProgressIndicator();
            } else if (snapshot.hasError) {
              return Text('Error: ${snapshot.error}');
            } else {
              final details = snapshot.data;
              widget.onLocationChanged(details ??
                  'Location details are not available'); // Send location data to parent
              return Text(details ?? 'Location details are not available');
            }
          },
        ),
      ),
    );
  }
}

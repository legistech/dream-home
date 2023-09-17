import 'package:flutter_map/flutter_map.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';

class Location {
  Position? _currentLocation;
  String? _locationDetails;

  Position? get currentLocation => _currentLocation;
  String? get locationDetails => _locationDetails;

  final MapController mapController = MapController();

  Future<void> _getLocation() async {
    GeolocatorPlatform geolocator = GeolocatorPlatform.instance;
    LocationPermission permission = await geolocator.requestPermission();

    // request location permissions
    if (permission == LocationPermission.denied) {
      // Handle permission denied
      _locationDetails = 'Location permission denied';
      return;
    }

    try {
      Position position = await geolocator.getCurrentPosition();
      _currentLocation = position;
      _locationDetails = await _getCityAndCountry(position);
    } catch (e) {
      // Handle any errors that may occur when getting the current position
      _locationDetails = 'Location details not available';
    }
  }

  Future<String?> _getCityAndCountry(Position position) async {
    try {
      List<Placemark> placemarks = await placemarkFromCoordinates(
        position.latitude,
        position.longitude,
      );

      if (placemarks.isNotEmpty) {
        Placemark placemark = placemarks.first;
        String? city = placemark.locality;
        return '$city';
      } else {
        return 'Location details not available';
      }
    } catch (e) {
      return 'An error occured';
    }
  }

  Future<String?> getLiveLocationDetails() async {
    await _getLocation();
    return _locationDetails;
  }
}

import 'package:geolocator/geolocator.dart';
import 'package:permission_handler/permission_handler.dart';

class LocationService {
  Future<Position> getUserLocation() async {
    await requestLocationPermission();
    return await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high,
    );
  }

  Future<void> requestLocationPermission() async {
    var status = await Permission.location.request();
    if (status.isGranted) {
      // Permission granted, you can now access the device's location.
    } else {
      // Permission denied. Handle this case appropriately in your app.
      final locationService = LocationService();
      final userLocation = await locationService.getUserLocation();
      // Use userLocation for your app's functionality.

    }
  }
}

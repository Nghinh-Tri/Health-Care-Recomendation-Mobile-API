import 'package:geolocator/geolocator.dart';

Future<Position> getCurrentLocation() async {
  final location = await Geolocator()
      .getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
  return location;
}

import 'package:geolocator/geolocator.dart';

Future<Position> getPosition() async {
  final location = await Geolocator()
      .getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
  return location;
}

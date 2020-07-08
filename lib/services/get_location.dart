import 'package:geolocator/geolocator.dart';
class GetLocation {
  double latitude;
  double longitude;
  Position position;

  Future<void> getLocation() async {
    try {
      position = await Geolocator().getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high);
      latitude = position.latitude;
      longitude = position.longitude;
      //print('$latitude , $longitude');
    }
    catch (e) {
      print(e);
    }
  }
}
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';

class GetLocation{
  Future<Position> getLocation() async {
    bool serviceEnabled;
    LocationPermission permission;
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      await Geolocator.openLocationSettings();
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      // await Geolocator.openLocationSettings();
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }

    return await Geolocator.getCurrentPosition();
  }
  Future<String> getAddressFormLongitude(Position position)async{
    String address="";
    List<Placemark> placemarks = await placemarkFromCoordinates(position.latitude, position.longitude);
    var place=placemarks[0];
    address="${place.street},${place.subLocality},${place.locality},${place.postalCode},${place.locality},${place.country}";
    return address;
  }
}
import 'package:location/location.dart';


class LocationController {

  static final Location _location = Location();


  static Future<LocationData?> getCurrentLocation() async {

    bool serviceEnabled;
    PermissionStatus permissionGranted;

    //Show an alert dialog to request the user to activate the Location Service
    serviceEnabled = await _location.serviceEnabled();
    if (!serviceEnabled) {
      serviceEnabled = await _location.requestService();
      if (!serviceEnabled) {
        return null; //denied
      }
    }

    //Request Location Permission
    permissionGranted = await _location.hasPermission();
    if (permissionGranted == PermissionStatus.denied) {
      permissionGranted = await _location.requestPermission();
      if (permissionGranted != PermissionStatus.granted) {
        return null;
      }
    }


    //Get Location coordinates
    return await _location.getLocation();
  }


}
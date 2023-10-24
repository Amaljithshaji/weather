import 'dart:convert';

import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart' as http;
import 'package:weather/model/weathermodel.dart';

class Contoller {
  static const url = 'https://api.openweathermap.org/data/2.5/weather';
  // ignore: prefer_typing_uninitialized_variables
  final api;
  Contoller({required this.api});
  fetchweatherdata(String cityName) async {
    var response = await http.get(Uri.parse('$url?q=$cityName&appid=$api'));
    var decodedata = jsonDecode(response.body);
    if (response.statusCode == 200) {
      return WeatherApi.fromJson(decodedata);
    } else {
      throw Exception('data not loaded ');
    }
  }

  getLoction() async {
    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
    }
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);

    List<Placemark> placemarks =
        await placemarkFromCoordinates(position.latitude, position.longitude);

    String? city = placemarks[0].locality;

    return city?? "";
  }
}

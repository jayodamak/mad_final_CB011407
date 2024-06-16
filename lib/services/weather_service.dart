// // weather_service.dart
// import 'dart:convert';
// import 'package:http/http.dart' as http;
// import 'package:geolocator/geolocator.dart';
// import '../models/weather_model.dart';
//
// class WeatherService {
//   final String apiKey;
//
//   WeatherService(this.apiKey);
//
//   Future<String> getCurrentCity() async {
//     Position position = await Geolocator.getCurrentPosition(
//         desiredAccuracy: LocationAccuracy.high);
//     final response = await http.get(Uri.parse(
//         'https://api.bigdatacloud.net/data/reverse-geocode-client?latitude=${position.latitude}&longitude=${position.longitude}&localityLanguage=en'));
//     if (response.statusCode == 200) {
//       final data = json.decode(response.body);
//       return data['city'] ?? 'Unknown City';
//     } else {
//       throw Exception('Failed to get city name');
//     }
//   }
//
//   Future<Weather> getWeather(String cityName) async {
//     final url =
//         'https://api.openweathermap.org/data/2.5/weather?q=$cityName&units=metric&appid=$apiKey';
//     final response = await http.get(Uri.parse(url));
//     if (response.statusCode == 200) {
//       final data = json.decode(response.body);
//       return Weather.fromJson(data);
//     } else {
//       throw Exception('Failed to load weather data');
//     }
//   }
// }

// import 'package:flutter/material.dart';
//
// import '../models/weather_model.dart';
// import '../services/weather_service.dart';
//
//
// class WeatherPage extends StatefulWidget {
//   const WeatherPage({super.key});
//
//   @override
//   State<WeatherPage> createState() => _WeatherPageState();
// }
//
// class _WeatherPageState extends State<WeatherPage> {
//
//   //api key
//   final _weatherService = WeatherService('4648f9e49733e8a7747b08bccc6d5fe1');
//   Weather? _weather;
//
//   //fetch weather data
//   _fetchWeather() async {
//     //get the current city
//     String cityName = await _weatherService.getCurrentCity();
//
//     //get weather for city
//     try {
//       final weather = await _weatherService.getWeather(cityName);
//       setState(() {
//         _weather = weather;
//       });
//     }
//     // catch any errors
//     catch (e) {
//       print(e);
//     }
//   }
//
//   //weather animations
//   String getWeatherIcon(String mainCondition) {
//     switch (mainCondition) {
//       case 'Thunderstorm':
//         return '⛈️';
//       case 'Drizzle':
//         return '🌧️';
//       case 'Rain':
//         return '🌧️';
//       case 'Snow':
//         return '❄️';
//       case 'Clear':
//         return '☀️';
//       case 'Clouds':
//         return '☁️';
//       default:
//         return '🌫️';
//     }
//   }
//
//   //init state
//   @override
//   void initState() {
//     super.initState();
//
//     //fetch weather on startup
//     _fetchWeather();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.yellow[700],
//         body: Center(
//           child: Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 // city name
//                 Text(_weather?.cityName ?? 'Loading City...'),
//
//                 // animation
//                 // Lottie.asset(getWeatherAnimation(_weather?.mainCondition)),
//
//                 // temperature
//                 Text('${_weather?.temperature.round()}°C'),
//
//                 // weather condition
//                 Text(_weather?.mainCondition ?? ''),
//               ]
//           ),
//         ),
//         );
//   }
//
//   }
//
//
//
//
//

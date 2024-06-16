import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart' as http;
import 'package:internet_connection_checker/internet_connection_checker.dart';
import '../components/popular_list.dart';
import '../components/screen_1.dart';
import '../components/screen_2.dart';
import '../components/screen_3.dart';
import '../components/screen_4.dart';
import '../components/search_box.dart';
import 'weather_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _controller = PageController();
  String _cityName = 'Loading...';
  String _temperature = '';
  String _weatherEmoji = '🌞'; // Default to sunny
  late StreamSubscription<InternetConnectionStatus> _connectionSubscription;
  bool _isDeviceConnected = true; // Assume initially connected
  bool _isAlertShown = false;

  @override
  void initState() {
    super.initState();
    _initInternetConnectionListener();
    _getCurrentLocation();
  }

  void _initInternetConnectionListener() {
    _connectionSubscription =
        InternetConnectionChecker().onStatusChange.listen((status) {
          setState(() {
            _isDeviceConnected = status == InternetConnectionStatus.connected;
            if (!_isDeviceConnected && !_isAlertShown) {
              _showNoInternetDialog();
              _isAlertShown = true;
            } else if (_isDeviceConnected && _isAlertShown) {
              Navigator.of(context).pop(); // Dismiss dialog if connected
              _isAlertShown = false;
            }
          });
        });
  }

  Future<void> _getCurrentLocation() async {
    try {
      LocationPermission permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied ||
          permission == LocationPermission.deniedForever) {
        setState(() {
          _cityName = 'Permission Denied';
        });
        return;
      }

      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high);
      print('Position: ${position.latitude}, ${position.longitude}');
      _getWeather(position.latitude, position.longitude);
    } catch (e) {
      print('Error getting location: $e');
      setState(() {
        _cityName = 'Error getting location';
      });
    }
  }

  Future<void> _getWeather(double latitude, double longitude) async {
    final apiKey = '4648f9e49733e8a7747b08bccc6d5fe1';
    final url =
        'https://api.openweathermap.org/data/2.5/weather?lat=$latitude&lon=$longitude&units=metric&appid=$apiKey';

    try {
      final response = await http.get(Uri.parse(url));
      print('Weather API Response: ${response.statusCode} - ${response.body}');
      if (response.statusCode == 200) {
        final weatherData = json.decode(response.body);
        print('Weather Data: $weatherData');
        setState(() {
          _cityName = weatherData['name'];
          _temperature = weatherData['main']['temp'].toString();
          _weatherEmoji = _getWeatherEmoji(weatherData['weather'][0]['description']);
        });
      } else {
        print('Failed to load weather data: ${response.reasonPhrase}');
        setState(() {
          _cityName = 'Error fetching weather';
        });
      }
    } catch (e) {
      print('Error fetching weather: $e');
      setState(() {
        _cityName = 'Error fetching weather';
      });
    }
  }

  String _getWeatherEmoji(String description) {
    switch (description.toLowerCase()) {
      case 'clear sky':
        return '🌞';
      case 'few clouds':
      case 'scattered clouds':
      case 'broken clouds':
        return '☁️';
      case 'shower rain':
      case 'rain':
        return '🌧️';
      case 'thunderstorm':
        return '⛈️';
      case 'snow':
        return '❄️';
      case 'mist':
        return '🌫️';
      default:
        return '❓';
    }
  }

  void _showNoInternetDialog() {
    showDialog(
      context: context,
      barrierDismissible: false, // Prevent dialog from closing on outside tap
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("No Internet Connection"),
          content: Text("Please check your internet connection."),
          actions: <Widget>[
            TextButton(
              child: Text("OK"),
              onPressed: () {
                Navigator.of(context).pop(); // Close dialog
              },
            ),
          ],
        );
      },
    );
  }

  @override
  void dispose() {
    _connectionSubscription.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellow.shade800,
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 15),

            // Top Container with Weather and City
            Container(
              padding: const EdgeInsets.symmetric(vertical: 10),
              decoration: BoxDecoration(
                color: Colors.yellow[900],
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.location_on,
                        color: Colors.white,
                        size: 30,
                      ),
                      SizedBox(width: 10),
                      Text(
                        _cityName,
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 5),
                  Text(
                    _weatherEmoji,
                    style: TextStyle(
                      fontSize: 50,
                    ),
                  ),
                  Text(
                    '$_temperature°C',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: SearchBox(),
            ),
            const SizedBox(height: 15),

            Container(
              height: 185, // Set a fixed height for the PageView
              child: PageView(
                controller: _controller,
                children: const [
                  Screen1(),
                  Screen2(),
                  Screen3(),
                  Screen4(),
                  // WeatherPage(),
                ],
              ),
            ),

            const SizedBox(height: 15),

            Container(
              decoration: BoxDecoration(
                color: Colors.yellow[50],
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(40),
                  topRight: Radius.circular(40),
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              child: const PopularList(),
            ),
          ],
        ),
      ),
    );
  }
}

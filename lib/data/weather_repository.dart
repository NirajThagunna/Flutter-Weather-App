import 'dart:math';

import 'model/weather.dart';

abstract class WeatherRepository {
  /// throws [NetworkException]
  Future<Weather> fetchWeather(String cityName);
}

class FakeWeatherRepository implements WeatherRepository {
  @override
  Future<Weather> fetchWeather(String cityName) {
    // Simulate network delay
    return Future.delayed(
      const Duration(seconds: 1),
      () {
        final random = Random();

        // Simulate some network exception
        if (random.nextBool()) {
          throw NetworkException();
        }

        return Weather(
          cityName: cityName,
          // Random number less than 36
          temperatureCelsius: 20 + random.nextInt(15) + random.nextDouble(),
        );
      },
    );
  }
}

class NetworkException implements Exception {}

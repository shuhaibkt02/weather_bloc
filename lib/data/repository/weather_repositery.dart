import 'dart:convert';

import 'package:weather_bloc/data/model/weather_model.dart';
import 'package:weather_bloc/data/provider/weather_data_provider.dart';

class WeatherRepositery {
  final WeatherDataProvider weatherDataProvider;

  WeatherRepositery({required this.weatherDataProvider});

  Future<WeatherModel> getCurrentWeather(String cityName) async {
    try {
      final weatherData = await weatherDataProvider.getCurrentWeather(cityName);
      final data = jsonDecode(weatherData);
      if (data['cod'] != 200) {
        return throw 'issue';
      }
      
      return WeatherModel.fromJson(data);
    } catch (e) {
      throw e.toString();
    }
  }
}

class WeatherModel {
  final String cityName;
  final String weatherStatus;
  final double celsius;
  final int humidity;
  final double wind;

  WeatherModel({
    required this.cityName,
    required this.weatherStatus,
    required this.celsius,
    required this.humidity,
    required this.wind,
  });

  factory WeatherModel.fromJson(Map<String, dynamic> map) {
    return WeatherModel(
      cityName: map['name'],
      weatherStatus: map['weather'][0]['description'],
      celsius: map['main']['temp'],
      humidity: map['main']['humidity'],
      wind: map['wind']['speed'],
    );
  }
}

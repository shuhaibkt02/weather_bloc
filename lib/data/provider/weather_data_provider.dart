import 'package:http/http.dart' as http;

const apiKey = "9e2bc7b60b6f640f55f6276b515509ad";

class WeatherDataProvider {
  Future<String> getCurrentWeather(String cityName) async {
    try {
      const baseUri = "https://api.openweathermap.org/data/2.5/weather?q=";

      final res = await http
          .get(Uri.parse("$baseUri$cityName&units=metric&appid=$apiKey"));
      // print(res.body);
      return res.body;
    } catch (e) {
      throw e.toString();
    }
  }
}

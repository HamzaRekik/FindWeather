import 'package:dio/dio.dart';
import 'package:weather/models/models.dart';

class WeatherService {
  Dio dio;
  final String baseURL = "https://api.weatherapi.com/v1";
  final String apiKey = "0bf96d7af7174bbcb4c175807231810";

  WeatherService(this.dio);

  Future<WeatherModel?> getWeather(String query) async {
    try {
      Response response =
          await dio.get("$baseURL/forecast.json?key=$apiKey&q=$query&days=1");

      return WeatherModel.fromJson(response);
    } catch (e) {
      return null;
    }
  }
}

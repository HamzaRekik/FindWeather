import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather/cubits/get_weather_cubit/get_weather_states.dart';
import 'package:weather/models/models.dart';
import 'package:weather/services/weather_service.dart';

class GetWeatherCubit extends Cubit<WeatherState> {
  GetWeatherCubit() : super(InitialWeatherState());

  WeatherModel? wm;
  getWeather({required String cityName}) async {
    try {
      wm = await WeatherService(Dio()).getWeather(cityName);
      emit(LoaddedWeatherState());
    } catch (e) {
      emit(FailedWeatherState());
    }
  }
}

Color getColor(double? temp) {
  if (temp == null) {
    return Colors.blueAccent;
  }
  if (temp <= 0) {
    return Colors.grey;
  } else if (temp <= 15 && temp > 0) {
    return Colors.green;
  } else if (temp > 15 && temp < 25) {
    return Colors.yellow;
  } else {
    return Colors.red;
  }
}

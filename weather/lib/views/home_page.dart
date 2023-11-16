import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather/cubits/get_weather_cubit/get_weather_cubit.dart';
import 'package:weather/cubits/get_weather_cubit/get_weather_states.dart';
import 'package:weather/views/search_page.dart';
import 'package:weather/widgets/error.dart';
import 'package:weather/widgets/no_weather.dart';

import '../widgets/weather_widget.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    var w = BlocProvider.of<GetWeatherCubit>(context);
    return BlocBuilder<GetWeatherCubit, WeatherState>(
        builder: (context, state) {
      return Scaffold(
          appBar: AppBar(
            backgroundColor: getColor(w.wm?.avgTemp),
            actions: [
              IconButton(
                  onPressed: () {
                    Navigator.of(context)
                        .push(MaterialPageRoute(builder: (context) {
                      return BlocBuilder<GetWeatherCubit, WeatherState>(
                          builder: (context, state) {
                        return SearchPage();
                      });
                    }));
                  },
                  icon: const Icon(Icons.search))
            ],
            title: const Text("Weather"),
            centerTitle: true,
          ),
          body: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [getColor(w.wm?.avgTemp), Colors.white],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
            child: BlocBuilder<GetWeatherCubit, WeatherState>(
                builder: (context, state) {
              if (state is InitialWeatherState) {
                return NoWeatherWidget();
              } else if (state is LoaddedWeatherState) {
                return WeatherWidget();
              } else {
                return ErrorWeatherWidget();
              }
            }),
          ));
    });
  }
}

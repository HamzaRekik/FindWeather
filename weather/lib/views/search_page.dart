import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather/cubits/get_weather_cubit/get_weather_cubit.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    var w = BlocProvider.of<GetWeatherCubit>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: getColor(w.wm?.avgTemp),
        title: const Text("Weather"),
        centerTitle: true,
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Center(
            child: TextField(
          onSubmitted: (value) {
            BlocProvider.of<GetWeatherCubit>(context)
                .getWeather(cityName: value);
            Navigator.pop(context);
          },
          decoration: InputDecoration(
              label: Text("Search"),
              contentPadding:
                  EdgeInsets.symmetric(horizontal: 15, vertical: 32),
              hintText: "Enter a city name...",
              suffixIcon: Icon(Icons.search),
              suffixIconColor: Colors.grey,
              focusedBorder:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(16)),
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(16))),
        )),
      ),
    );
  }
}

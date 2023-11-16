import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather/cubits/get_weather_cubit/get_weather_cubit.dart';

class WeatherWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var w = BlocProvider.of<GetWeatherCubit>(context).wm!;
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          w.location,
          style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold),
        ),
        Text(
          'Updated At : ${w.updatedAt.hour}:${w.updatedAt.minute}',
          style: TextStyle(fontSize: 22),
        ),
        SizedBox(
          height: 60,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Image(
              image: NetworkImage("https:" + w.image),
            ),
            Text('${w.avgTemp.round()}'),
            Text(
                "maxTemp : ${w.maxTemp.round()} \nminTemp : ${w.minTemp.round()}")
          ],
        ),
        SizedBox(
          height: 60,
        ),
        Text(
          w.status,
          style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}

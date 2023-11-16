import 'package:flutter/material.dart';

class NoWeatherWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        "there is no weather , try searching..",
        style: TextStyle(fontSize: 35),
      ),
    );
  }
}

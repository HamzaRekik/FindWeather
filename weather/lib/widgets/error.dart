import 'package:flutter/material.dart';

class ErrorWeatherWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        "an error occured...try later...",
        style: TextStyle(fontSize: 35),
      ),
    );
  }
}

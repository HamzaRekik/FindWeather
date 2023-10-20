import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:weather/views/search_page.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) {
                  return SearchPage();
                }));
              },
              icon: Icon(Icons.search))
        ],
        backgroundColor: Colors.blueAccent,
        title: const Text("Weather"),
        centerTitle: true,
      ),
      body: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.blueAccent, Colors.white],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Sfax",
                style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold),
              ),
              Text(
                "Updated at : 22:00",
                style: TextStyle(fontSize: 22),
              ),
              SizedBox(
                height: 60,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Image(
                    image: AssetImage("assets/sun.png"),
                    height: 100,
                    width: 100,
                  ),
                  Text("17"),
                  Text("maxTemp : 22 \nminTemp : 12")
                ],
              ),
              SizedBox(
                height: 60,
              ),
              Text(
                "Light Rain",
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
            ],
          )),
    );
  }
}

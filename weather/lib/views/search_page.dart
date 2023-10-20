import 'package:flutter/material.dart';

class SearchPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        title: const Text("Weather"),
        centerTitle: true,
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Center(
            child: TextField(
          onSubmitted: (value) {
            print(value);
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

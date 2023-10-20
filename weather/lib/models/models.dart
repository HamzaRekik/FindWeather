class WeatherModel {
  String location;
  String updatedAt;
  String image;
  double avgTemp;
  double maxTemp;
  double minTemp;
  String status;

  WeatherModel(
      {required this.location,
      required this.updatedAt,
      required this.image,
      required this.avgTemp,
      required this.maxTemp,
      required this.minTemp,
      required this.status});

  factory WeatherModel.fromJson(json) => WeatherModel(
      location: json["location"]["name"],
      updatedAt: json["current"]["last_updated"],
      image: json['forecast']["forecastday"][0]["day"]["condition"]["icon"],
      avgTemp: json['forecast']["forecastday"][0]["day"]["avgtemp_c"],
      maxTemp: json['forecast']["forecastday"][0]["day"]["maxtemp_c"],
      minTemp: json['forecast']["forecastday"][0]["day"]["mintemp_c"],
      status: json['forecast']["forecastday"][0]["day"]["condition"]["text"]);
}

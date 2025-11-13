import 'package:flutter/material.dart';

enum WeatherType { sunny, cloudy, veryCloudy, sunnyCloudy }

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.lightBlueAccent,
          actionsPadding: EdgeInsets.only(right: 10),
          actions: [Icon(Icons.menu, color: Colors.white,)],
        ),
        body: Padding(
          padding: EdgeInsets.all(20),
          child: ListView(
            children: [
              WeatherCard(
                city: "Phnom Penh",
                currentTemp: "30°C",
                minTemp: "Min: 25°C",
                maxTemp: "Max: 33°C",
                imagePath: "images/cloudy.png",
                weather: WeatherType.cloudy,
              ),
              SizedBox(height: 20),
              WeatherCard(
                city: "Tokyo",
                currentTemp: "18°C",
                minTemp: "Min: 12°C",
                maxTemp: "Max: 20°C",
                imagePath: "images/sunny.png",
                weather: WeatherType.sunny,
              ),
              SizedBox(height: 20),
              WeatherCard(
                city: "Paris",
                currentTemp: "10°C",
                minTemp: "Min: 5°C",
                maxTemp: "Max: 12°C",
                imagePath: "images/verycloudy.png",
                weather: WeatherType.veryCloudy,
              ),
              SizedBox(height: 20),
              WeatherCard(
                city: "Melbourne",
                currentTemp: "22°C",
                minTemp: "Min: 11°C",
                maxTemp: "Max: 23°C",
                imagePath: "images/sunnyCloudy.png",
                weather: WeatherType.sunnyCloudy,
              ),
            ],
          ),
        ),
      ),
    ),
  );
}

class WeatherCard extends StatelessWidget {
  final String city;
  final String currentTemp;
  final String minTemp;
  final String maxTemp;
  final String imagePath;
  final WeatherType weather;
  const WeatherCard({
    super.key,
    required this.city,
    required this.currentTemp,
    required this.minTemp,
    required this.maxTemp,
    required this.imagePath,
    required this.weather,
  });

  static const Map<WeatherType, List<Color>> seasonColors = {
    WeatherType.sunny: [Colors.orange, Colors.yellow],
    WeatherType.cloudy: [Colors.blueGrey, Colors.grey],
    WeatherType.veryCloudy: [Colors.black54, Colors.grey],
    WeatherType.sunnyCloudy: [Colors.lightBlueAccent, Colors.orangeAccent],
  };

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        PhysicalModel(
          color: Colors.transparent,
          elevation: 8,
          borderRadius: BorderRadius.circular(20),
          shadowColor: Colors.black45,
          child: Container(
            padding: const EdgeInsets.only(
              top: 20,
              bottom: 40,
              left: 20,
              right: 20,
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              gradient: LinearGradient(
                colors: seasonColors[weather]!,
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    CircleAvatar(
                      radius: 30,
                      backgroundColor: Colors.white24,
                      child: ClipOval(child: Image.asset(imagePath)),
                    ),
                    SizedBox(width: 20),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(city, style: TextStyle(fontSize: 22)),
                        Text(minTemp, style: TextStyle(fontSize: 12)),
                        Text(maxTemp, style: TextStyle(fontSize: 12)),
                      ],
                    ),
                  ],
                ),
                Text(currentTemp, style: TextStyle(fontSize: 24)),
              ],
            ),
          ),
        ),
        Positioned(
          right: -240,
          top: -20,
          bottom: -20,
          child: Container(
            width: 600,
            height: 600,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.white.withValues(alpha: 0.1),
            ),
          ),
        ),
      ],
    );
  }
}

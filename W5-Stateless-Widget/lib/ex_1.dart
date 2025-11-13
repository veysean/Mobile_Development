import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        body: Padding(
          padding: EdgeInsetsGeometry.all(40),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              HobbyCard(
                title: "Travelling",
                icondata: Icons.travel_explore_sharp,
                background: Colors.green,
              ),
              HobbyCard(
                title: "Skating",
                icondata: Icons.skateboarding_sharp,
                background: const Color.fromARGB(255, 35, 85, 109),
              ),
            ],
          ),
        ),
      ),
    ),
  );
}

class HobbyCard extends StatelessWidget {
  final String title;
  final IconData icondata;
  final Color background;
  const HobbyCard({
    super.key,
    required this.title,
    required this.icondata,
    this.background = Colors.blue,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(30),
      margin: EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: background,
      ),
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsetsGeometry.all(20),
              child: Icon(icondata, color: Colors.white),
            ),
            Text(title, style: TextStyle(color: Colors.white, fontSize: 25)),
          ],
        ),
      ),
    );
  }
}

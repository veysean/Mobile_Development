import 'package:flutter/material.dart';

//Exercise 4

void main() {
  runApp(
    MaterialApp(
      home: Container(
        padding: EdgeInsets.all(40),
        child: Column(
          children: [
            CustomeCard(text: "OOP"),
            CustomeCard(text: "DART", color: Colors.blue.shade300),
            CustomeCard.gradient(
              text: "FLUTTER",
              gradient: LinearGradient(
                colors: [
                  Colors.blue.shade300,
                  Colors.blue.shade600,
                  Colors.blue.shade900,
                ],
              ),
            ),
          ],
        ),
      ),
    ),
  );
}

class CustomeCard extends StatelessWidget {
  final String text;
  final Color? color;
  final Gradient? gradient;
  const CustomeCard({
    super.key,
    required this.text,
    this.color = Colors.blue,
    this.gradient,
  });
  const CustomeCard.gradient({
    super.key,
    required this.text,
    this.color,
    required this.gradient,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        color: color,
        gradient: gradient,
      ),
      child: Center(
        child: Text(
          text,
          style: TextStyle(
            color: Colors.white,
            decoration: TextDecoration.none,
          ),
        ),
      ),
    );
  }
}

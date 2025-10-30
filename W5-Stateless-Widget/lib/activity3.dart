import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        body: Center(
          child: Column(
            children: [
              GradiantButton(
                "Hello 1",
                start: Color(0xFF4E7DF5),
                end: Color(0xFF0335B6),
              ),
              GradiantButton(
                "Hello 2",
                start: Color(0xFF4E7DF5),
                end: Color(0xFF0335B6),
              ),
              GradiantButton(
                "Hello 3",
                start: Color(0xFF4E7DF5),
                end: Color(0xFF0335B6),
              ),
            ],
          ),
        ),
      ),
    ),
  );
}

class GradiantButton extends StatelessWidget {
  final String text;
  final Color start;
  final Color end;
  const GradiantButton(
    this.text, {
    super.key,
    required this.start,
    required this.end,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(40),
      margin: EdgeInsets.all(20),
      decoration: BoxDecoration(
        gradient: LinearGradient(colors: [start, end]),
        borderRadius: BorderRadius.circular(30),
      ),
      child: Text(
        text,
        style: TextStyle(
          fontSize: 35,
          color: Colors.white,
          decoration: TextDecoration.none,
        ),
      ),
    );
  }
}

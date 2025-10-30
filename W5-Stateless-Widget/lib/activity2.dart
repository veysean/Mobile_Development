import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        body: Center(
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.all(40),
                margin: EdgeInsets.all(20),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Color(0xFF4E7DF5), Color(0xFF0335B6)],
                  ),
                  borderRadius: BorderRadius.circular(30),
                ),
                child: const Text(
                  "HELLO 1",
                  style: TextStyle(
                    fontSize: 35,
                    color: Colors.white,
                    decoration: TextDecoration.none,
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.all(40),
                margin: EdgeInsets.all(20),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Color(0xFF4E7DF5), Color(0xFF0335B6)],
                  ),
                  borderRadius: BorderRadius.circular(30),
                ),
                child: const Text(
                  "HELLO 2",
                  style: TextStyle(
                    fontSize: 35,
                    color: Colors.white,
                    decoration: TextDecoration.none,
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.all(40),
                margin: EdgeInsets.all(20),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Color(0xFF4E7DF5), Color(0xFF0335B6)],
                  ),
                  borderRadius: BorderRadius.circular(30),
                ),
                child: const Text(
                  "HELLO 3",
                  style: TextStyle(
                    fontSize: 35,
                    color: Colors.white,
                    decoration: TextDecoration.none,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    ),
  );
}

import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text("HELLO")),
        body: Center(
          child: Column(
            children: [
              Container(
                width: 200,
                height: 200,
                color: Colors.amber,
                child: const Center(
                  child: Text(
                    'HI',
                    style: TextStyle(
                      fontSize: 50,
                      color: Color.fromARGB(255, 52, 7, 255),
                    ),
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

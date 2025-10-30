import 'package:flutter/material.dart';

//Exercise 2
void main() {
  runApp(
    MaterialApp(
      home: Container(
        color: Colors.blue.shade300,
        padding: EdgeInsets.all(40),
        margin: EdgeInsets.all(50),
        child: Container(
          // color: Colors.blue.shade600,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            color: Colors.blue.shade600,
          ),
          child: Center(
            child: Text(
              'CADT Students',
              style: TextStyle(
                color: Colors.white,
                decoration: TextDecoration.none,
              ),
            ),
          ),
        ),
      ),
    ),
  );
}

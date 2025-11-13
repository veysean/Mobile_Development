import 'package:flutter/material.dart';

enum Product {
  dart(
    title: 'Dart',
    description: 'The best object language',
    image: 'images/dart.png',
  ),
  flutter(
    title: 'Flutter',
    description: 'The best mobile widget library',
    image: 'images/flutter.png',
  ),
  firebase(
    title: 'Firebase',
    description: 'The best cloud database',
    image: 'images/firebase.png',
  );

  final String title;
  final String description;
  final String image;

  const Product({
    required this.title,
    required this.description,
    required this.image,
  });
}

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('Products'),),
        backgroundColor: Colors.blue,
        body: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            children: [
              ProductCard(type: Product.dart),
              SizedBox(height: 20),
              ProductCard(type: Product.flutter),
              SizedBox(height: 20),
              ProductCard(type: Product.firebase),
            ],
          ),
        ),
      ),
    ),
  );
}

class ProductCard extends StatelessWidget {
  final Product type;
  const ProductCard({super.key, required this.type});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
      ),
      padding: EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SizedBox(height: 5),
          Image.asset(
            type.image,
            width: 60,
            height: 60,
            alignment: AlignmentGeometry.topLeft,
          ),
          SizedBox(height: 5),
          Text(type.title, style: TextStyle(fontSize: 24)),
          SizedBox(height: 5),
          Text(type.description, style: TextStyle(fontSize: 16)),
        ],
      ),
    );
  }
}

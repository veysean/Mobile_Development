import 'package:flutter/material.dart';

void main() => runApp(
  MaterialApp(
    home: Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text("Favorite cards"),
      ),
      body: Column(
        children: [
          FavoriteCard(initailFavorite: true),
          FavoriteCard(initailFavorite: false),
          FavoriteCard(initailFavorite: true),
        ],
      ),
    ),
  ),
);

class FavoriteCard extends StatefulWidget {
  final bool initailFavorite;
  const FavoriteCard({super.key, required this.initailFavorite});

  @override
  State<FavoriteCard> createState() => _FavoriteCardState();
}

class _FavoriteCardState extends State<FavoriteCard> {
  late bool isFavorite;

  @override
  void initState() {
    super.initState();
    isFavorite = widget.initailFavorite;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      // YOUR CODE
      decoration: BoxDecoration(
        border: Border(bottom: BorderSide(width: .5, color: Colors.grey)),
      ),
      padding: EdgeInsets.only(left: 10, right: 10, top: 20, bottom: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Title",
                  style: TextStyle(
                    color: Colors.blue,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                SizedBox(height: 15),
                Text("Description"),
              ],
            ),
          ),
          IconButton(
            onPressed: () {
              setState(() {
                isFavorite = !isFavorite;
              });
            },
            icon: Icon(
              isFavorite ? Icons.favorite : Icons.favorite_border,
              color: isFavorite ? Colors.red : Colors.grey,
            ),
          ),
        ],
      ),
    );
  }
}

// class FavoriteCard extends StatelessWidget {
//   final bool isFavorite;
//   const FavoriteCard({super.key, required this.isFavorite});

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       // YOUR CODE
//       decoration: BoxDecoration(
//         border: Border(bottom: BorderSide(width: .5, color: Colors.grey)),
//       ),
//       padding: EdgeInsets.only(left: 10, right: 10, top: 20, bottom: 20),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//         children: [
//           Expanded(
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Text(
//                   "Title",
//                   style: TextStyle(
//                     color: Colors.blue,
//                     fontWeight: FontWeight.w400,
//                   ),
//                 ),
//                 SizedBox(height: 15),
//                 Text("Description"),
//               ],
//             ),
//           ),
//           IconButton(
//             onPressed: () => {},
//             icon: Icon(
//               isFavorite ? Icons.favorite : Icons.favorite_border,
//               color: isFavorite ? Colors.red : Colors.grey,
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';

class CardData {
  final String title;
  final String description;
  final String imageUrl;

  CardData({required this.title, required this.description, required this.imageUrl});
}

class CardWidget extends StatelessWidget {
  final String title;
  final String description;
  final String? imageUrl;
  final void Function()? onPressed;

  const CardWidget({
    Key? key,
    required this.title,
    required this.description,
    this.imageUrl,
    this.onPressed,
  }) : super(key: key);



  @override
  Widget build(BuildContext context) {
    return Card(

      color: Color(0xFFB9C2D7),
      child: Column(

        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          // Image.asset(imageUrl),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              title,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(description),
          ),
        ],
      ),
    );
  }

}

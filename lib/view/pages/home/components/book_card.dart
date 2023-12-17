import 'package:flutter/material.dart';

class BookCard extends StatelessWidget {
  final String image;
  final String author;
  final String name;
  const BookCard({
    Key? key,
    required this.image,
    required this.author,
    required this.name,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5, // Set the card elevation
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Flexible(
                fit: FlexFit.tight,
                flex: 5,
                child: AspectRatio(
                  aspectRatio: 1,
                  child: Image.network(
                    image,
                    fit: BoxFit.cover,
                  ),
                )),
            const SizedBox(
              height: 8,
            ),
            Flexible(
              fit: FlexFit.loose,
              flex: 2,
              child: Text(
                name,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 8.0),
            Flexible(
              fit: FlexFit.loose,
              flex: 1,
              child: Text(
                author,
                style: const TextStyle(fontSize: 14.0),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

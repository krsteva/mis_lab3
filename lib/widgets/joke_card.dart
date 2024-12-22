import 'package:flutter/material.dart';

class JokeCard extends StatelessWidget {
  final String type;
  final VoidCallback onFavoriteToggle;
  final bool isFavorite;

  const JokeCard({
    super.key,
    required this.type,
    required this.onFavoriteToggle,
    this.isFavorite = false,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      margin: const EdgeInsets.all(8.0),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                type,
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
            IconButton(
              icon: Icon(
                isFavorite ? Icons.favorite : Icons.favorite_border,
                color: isFavorite ? Colors.red : Colors.grey,
              ),
              onPressed: onFavoriteToggle,
            ),
          ],
        ),
      ),
    );
  }
}

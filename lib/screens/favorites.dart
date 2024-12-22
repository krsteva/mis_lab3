import 'package:flutter/material.dart';
import '../services/favorite_service.dart';

class FavoritesPage extends StatelessWidget {
  const FavoritesPage({super.key});

  @override
  Widget build(BuildContext context) {
    final favorites = FavoritesService.getFavorites();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Favorite Jokes'),
        backgroundColor: Colors.blue,
      ),
      body: favorites.isEmpty
          ? const Center(child: Text('No favorite jokes yet!'))
          : ListView.builder(
        itemCount: favorites.length,
        itemBuilder: (context, index) {
          final joke = favorites[index];
          return ListTile(
            title: Text(joke.setup),
            subtitle: Text(joke.punchline),
          );
        },
      ),
    );
  }
}

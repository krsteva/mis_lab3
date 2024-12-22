import 'package:flutter/material.dart';
import '../models/joke_model.dart';
import '../services/api_service.dart';
import '../services/favorite_service.dart';

class JokesByTypePage extends StatefulWidget {
  const JokesByTypePage({super.key});

  @override
  State<JokesByTypePage> createState() => _JokesByTypePageState();
}

class _JokesByTypePageState extends State<JokesByTypePage> {
  List<Joke> jokes = [];
  String type = '';

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final arguments = ModalRoute.of(context)!.settings.arguments as String;
    type = arguments;
    getJokesByType();
  }

  void getJokesByType() async {
    ApiService.getJokesByType(type).then((response) {
      setState(() {
        jokes = response.map((json) => Joke.fromJson(json)).toList();
      });
    });
  }

  void toggleFavorite(Joke joke) {
    setState(() {
      FavoritesService.toggleFavorite(joke);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(type),
      ),
      body: jokes.isEmpty
          ? const Center(child: CircularProgressIndicator())
          : ListView.builder(
        itemCount: jokes.length,
        itemBuilder: (context, index) {
          final joke = jokes[index];
          return ListTile(
            title: Text(joke.setup),
            subtitle: Text(joke.punchline),
            trailing: IconButton(
              icon: Icon(
                FavoritesService.isFavorite(joke)
                    ? Icons.favorite
                    : Icons.favorite_border,
                color: FavoritesService.isFavorite(joke)
                    ? Colors.red
                    : null,
              ),
              onPressed: () => toggleFavorite(joke),
            ),
          );
        },
      ),
    );
  }
}

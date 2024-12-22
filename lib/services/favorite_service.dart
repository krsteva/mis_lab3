import '../models/joke_model.dart';

class FavoritesService {
  static final List<Joke> _favorites = [];

  static List<Joke> getFavorites() => _favorites;

  static void toggleFavorite(Joke joke) {
    if (_favorites.contains(joke)) {
      _favorites.remove(joke);
    } else {
      _favorites.add(joke);
    }
  }

  static bool isFavorite(Joke joke) => _favorites.contains(joke);
}

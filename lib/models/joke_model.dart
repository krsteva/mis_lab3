class Joke {
  int id;
  String type;
  String setup;
  String punchline;
  bool isFavorite;

  Joke({
    required this.id,
    required this.type,
    required this.setup,
    required this.punchline,
    this.isFavorite = false,
  });

  factory Joke.fromJson(Map<String, dynamic> json) => Joke(
    id: json['id'],
    type: json['type'],
    setup: json['setup'],
    punchline: json['punchline'],
  );

  Map<String, dynamic> toJson() => {
    'id': id,
    'type': type,
    'setup': setup,
    'punchline': punchline,
    'isFavorite': isFavorite,
  };
}

import 'package:flutter/material.dart';
import '../services/api_service.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<String> jokeTypes = [];

  @override
  void initState() {
    super.initState();
    fetchJokeTypes();
  }

  void fetchJokeTypes() async {
    final types = await ApiService.getJokeTypes();
    setState(() {
      jokeTypes = types;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Joke App'),
        backgroundColor: Colors.blue,
        actions: [
          IconButton(
            icon: const Icon(Icons.favorite, color: Colors.white),
            onPressed: () => Navigator.pushNamed(context, '/favorites'),
          ),
          IconButton(
            icon: const Icon(Icons.casino, color: Colors.white),
            onPressed: () => Navigator.pushNamed(context, '/random'),
          ),
        ],
      ),
      body: jokeTypes.isEmpty
          ? const Center(child: CircularProgressIndicator())
          : ListView.builder(
        itemCount: jokeTypes.length,
        itemBuilder: (context, index) {
          final type = jokeTypes[index];
          return Card(
            margin: const EdgeInsets.symmetric(
              vertical: 8.0,
              horizontal: 16.0,
            ),
            child: ListTile(
              title: Text(
                type,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
              trailing: const Icon(Icons.arrow_forward_ios),
              onTap: () {
                Navigator.pushNamed(
                  context,
                  '/jokesByType',
                  arguments: type,
                );
              },
            ),
          );
        },
      ),
    );
  }
}

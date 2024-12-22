import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:lab_2/services/firebase_messaging_service.dart';
import 'package:lab_2/services/notification_service.dart';
import 'screens/home.dart';
import 'screens/jokes_by_type.dart';
import 'screens/random_joke.dart';
import 'screens/favorites.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(); // Initialize Firebase
  await FirebaseMessagingService.initialize();

  String? token = await FirebaseMessagingService.getToken();
  print('FCM Token: $token'); // Print the token to the console for testing


  await NotificationService.initialize(); // Ini
  runApp(const JokeApp());
}

class JokeApp extends StatelessWidget {
  const JokeApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Joke App',
      initialRoute: '/',
      routes: {
        '/': (context) => const Home(),
        '/jokesByType': (context) => const JokesByTypePage(),
        '/random': (context) => const RandomJokePage(),
        '/favorites': (context) => const FavoritesPage(),
      },
    );
  }
}

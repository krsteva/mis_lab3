// File generated by FlutterFire CLI.
// ignore_for_file: type=lint
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

/// Default [FirebaseOptions] for use with your Firebase apps.
///
/// Example:
/// ```dart
/// import 'firebase_options.dart';
/// // ...
/// await Firebase.initializeApp(
///   options: DefaultFirebaseOptions.currentPlatform,
/// );
/// ```
class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      return web;
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      case TargetPlatform.macOS:
        return macos;
      case TargetPlatform.windows:
        return windows;
      case TargetPlatform.linux:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for linux - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyC0eN7v-p79xI4yu3zJk2U4vd-kMWi82rc',
    appId: '1:277280113640:web:8507ddb1f587311bbe5a5d',
    messagingSenderId: '277280113640',
    projectId: 'jokes-app-c4d0e',
    authDomain: 'jokes-app-c4d0e.firebaseapp.com',
    storageBucket: 'jokes-app-c4d0e.firebasestorage.app',
    measurementId: 'G-3RP55KEJGZ',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAR6yNyBfVwaD6wjaf2eBgXH8F-tTH5wlc',
    appId: '1:277280113640:android:fba8fcfdeebf2173be5a5d',
    messagingSenderId: '277280113640',
    projectId: 'jokes-app-c4d0e',
    storageBucket: 'jokes-app-c4d0e.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyB8hN1FeiV8Ys_MZRPuGVIk4jloWX36Wis',
    appId: '1:277280113640:ios:5e4b149aa154e93abe5a5d',
    messagingSenderId: '277280113640',
    projectId: 'jokes-app-c4d0e',
    storageBucket: 'jokes-app-c4d0e.firebasestorage.app',
    iosBundleId: 'com.example.lab2',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyB8hN1FeiV8Ys_MZRPuGVIk4jloWX36Wis',
    appId: '1:277280113640:ios:5e4b149aa154e93abe5a5d',
    messagingSenderId: '277280113640',
    projectId: 'jokes-app-c4d0e',
    storageBucket: 'jokes-app-c4d0e.firebasestorage.app',
    iosBundleId: 'com.example.lab2',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyC0eN7v-p79xI4yu3zJk2U4vd-kMWi82rc',
    appId: '1:277280113640:web:2d3ddb33562b19adbe5a5d',
    messagingSenderId: '277280113640',
    projectId: 'jokes-app-c4d0e',
    authDomain: 'jokes-app-c4d0e.firebaseapp.com',
    storageBucket: 'jokes-app-c4d0e.firebasestorage.app',
    measurementId: 'G-TEG81SZ66T',
  );
}

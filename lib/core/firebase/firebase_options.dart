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
    // if (kIsWeb) {
    //   return web;
    // }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      // case TargetPlatform.iOS:
      //   return ios;
      // case TargetPlatform.macOS:
      //   return macos;
      // case TargetPlatform.windows:
      //   return windows;
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

  // static const FirebaseOptions web = FirebaseOptions(
  //   apiKey: 'AIzaSyAKgFWQORkRCnQPxAQK3wqAoodqzA-8oO8',
  //   appId: '1:179966136343:web:c720d723508a63c0b9cc52',
  //   messagingSenderId: '179966136343',
  //   projectId: 'firebase-auth-007',
  //   authDomain: 'fir-auth-007-83338.firebaseapp.com',
  //   storageBucket: 'firebase-auth-007.appspot.com',
  // );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAJzAnK2kNlfKc8qhlWsBaU_NQXjSXlSzA',
    appId: '1:814776988094:android:1b17e51b5ef19043ad89ef',
    messagingSenderId: '814776988094',
    projectId: 'bozor-8c504',
    storageBucket: 'bozor-8c504.firebasestorage.app',
  );

  // static const FirebaseOptions ios = FirebaseOptions(
  //   apiKey: 'AIzaSyBWJ6-pXlmphU_LqhQoSD6dXT2kVee18ZU',
  //   appId: '1:179966136343:ios:2f36e375879efd3fb9cc52',
  //   messagingSenderId: '179966136343',
  //   projectId: 'firebase-auth-007',
  //   storageBucket: 'firebase-auth-007.appspot.com',
  //   iosBundleId: 'com.example.authFirebase',
  // );
  //
  // static const FirebaseOptions macos = FirebaseOptions(
  //   apiKey: 'AIzaSyBWJ6-pXlmphU_LqhQoSD6dXT2kVee18ZU',
  //   appId: '1:179966136343:ios:2f36e375879efd3fb9cc52',
  //   messagingSenderId: '179966136343',
  //   projectId: 'firebase-auth-007',
  //   storageBucket: 'firebase-auth-007.appspot.com',
  //   iosBundleId: 'com.example.authFirebase',
  // );
  //
  // static const FirebaseOptions windows = FirebaseOptions(
  //   apiKey: 'AIzaSyAKgFWQORkRCnQPxAQK3wqAoodqzA-8oO8',
  //   appId: '1:179966136343:web:85628522eff9bbcab9cc52',
  //   messagingSenderId: '179966136343',
  //   projectId: 'firebase-auth-007',
  //   authDomain: 'fir-auth-007-83338.firebaseapp.com',
  //   storageBucket: 'firebase-auth-007.appspot.com',
  // );
}
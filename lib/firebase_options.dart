// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars, avoid_classes_with_only_static_members
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
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for windows - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
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
    apiKey: 'AIzaSyAu0avAjmzXGiUH0TM2hAgNj7fONmJS70c',
    appId: '1:821982076742:web:4f58cfe055ae80cd564f47',
    messagingSenderId: '821982076742',
    projectId: 'quizapi-949ae',
    authDomain: 'quizapi-949ae.firebaseapp.com',
    storageBucket: 'quizapi-949ae.appspot.com',
    measurementId: 'G-4G4QXV0BXL',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCd_dfetoLVuN54AAHfwEzAckOiIQHGS8M',
    appId: '1:821982076742:android:8607308f5b24f50d564f47',
    messagingSenderId: '821982076742',
    projectId: 'quizapi-949ae',
    storageBucket: 'quizapi-949ae.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAjNV9Uc1zFQYSQENH8-sy-EE5n0N_qupU',
    appId: '1:821982076742:ios:77d94612facc6e3f564f47',
    messagingSenderId: '821982076742',
    projectId: 'quizapi-949ae',
    storageBucket: 'quizapi-949ae.appspot.com',
    iosClientId: '821982076742-6m4993hr9dco7gjidtutghgidu0fnucr.apps.googleusercontent.com',
    iosBundleId: 'com.example.quizapi',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyAjNV9Uc1zFQYSQENH8-sy-EE5n0N_qupU',
    appId: '1:821982076742:ios:77d94612facc6e3f564f47',
    messagingSenderId: '821982076742',
    projectId: 'quizapi-949ae',
    storageBucket: 'quizapi-949ae.appspot.com',
    iosClientId: '821982076742-6m4993hr9dco7gjidtutghgidu0fnucr.apps.googleusercontent.com',
    iosBundleId: 'com.example.quizapi',
  );
}

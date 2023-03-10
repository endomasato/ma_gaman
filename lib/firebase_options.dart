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
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for macos - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
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
    apiKey: 'AIzaSyAwakSdnKRK5ZYaqCeikiPT7oZWRYh2mMU',
    appId: '1:165535589096:web:da97bb947bd1c61c69df5d',
    messagingSenderId: '165535589096',
    projectId: 'fir-todo-a4511',
    authDomain: 'fir-todo-a4511.firebaseapp.com',
    storageBucket: 'fir-todo-a4511.appspot.com',
    measurementId: 'G-WHG0NMZYKS',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDaUsN1wbEFGof7v5J2eVmDdhkwTvOvH4M',
    appId: '1:165535589096:android:51e6cba76f25d65b69df5d',
    messagingSenderId: '165535589096',
    projectId: 'fir-todo-a4511',
    storageBucket: 'fir-todo-a4511.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBqKuqbwexfvM8N6WkLvITPmVro9iQew08',
    appId: '1:165535589096:ios:80fe15884a4a7f7469df5d',
    messagingSenderId: '165535589096',
    projectId: 'fir-todo-a4511',
    storageBucket: 'fir-todo-a4511.appspot.com',
    iosClientId: '165535589096-soard8idg1u437nmfhrkp36qtgc444o9.apps.googleusercontent.com',
    iosBundleId: 'com.example.maGaman',
  );
}

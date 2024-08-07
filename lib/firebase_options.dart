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
      throw UnsupportedError(
        'DefaultFirebaseOptions have not been configured for web - '
        'you can reconfigure this by running the FlutterFire CLI again.',
      );
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

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCoBmWpbO4rp-8C9fiw4abs0wnFTekK0oc',
    appId: '1:192678674581:android:55f01349c9e6f00b805b9c',
    messagingSenderId: '192678674581',
    projectId: 'pzem-2d91d',
    databaseURL: 'https://pzem-2d91d-default-rtdb.asia-southeast1.firebasedatabase.app',
    storageBucket: 'pzem-2d91d.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBcseqO1ZHYNLsAIKvsBpNOF1kXETbE1g0',
    appId: '1:192678674581:ios:5e9040af6cd7a8f0805b9c',
    messagingSenderId: '192678674581',
    projectId: 'pzem-2d91d',
    databaseURL: 'https://pzem-2d91d-default-rtdb.asia-southeast1.firebasedatabase.app',
    storageBucket: 'pzem-2d91d.appspot.com',
    iosBundleId: 'com.example.electronicData',
  );
}

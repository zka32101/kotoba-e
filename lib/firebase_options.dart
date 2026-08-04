// File generated from google-services.json
// ignore_for_file: type=lint
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) return web;
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCBwPBEXptIW_8wl0_hWtZhpSJcuod00Eg',
    appId: '1:492221061005:android:fcae0a104d83f89ec88fc4',
    messagingSenderId: '492221061005',
    projectId: 'petit-works-education',
    storageBucket: 'petit-works-education.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCBwPBEXptIW_8wl0_hWtZhpSJcuod00Eg',
    appId: '1:492221061005:ios:fcae0a104d83f89ec88fc4',
    messagingSenderId: '492221061005',
    projectId: 'petit-works-education',
    storageBucket: 'petit-works-education.firebasestorage.app',
  );

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyCBwPBEXptIW_8wl0_hWtZhpSJcuod00Eg',
    appId: '1:492221061005:web:fcae0a104d83f89ec88fc4',
    messagingSenderId: '492221061005',
    projectId: 'petit-works-education',
    storageBucket: 'petit-works-education.firebasestorage.app',
  );
}

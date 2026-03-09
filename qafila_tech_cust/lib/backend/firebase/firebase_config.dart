import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyAYYVr_7tEFkZNF6SmIOVHeYVeI2lVVQUs",
            authDomain: "maps-tracking-fbnri9.firebaseapp.com",
            projectId: "maps-tracking-fbnri9",
            storageBucket: "maps-tracking-fbnri9.appspot.com",
            messagingSenderId: "140735225773",
            appId: "1:140735225773:web:30c4f211b5a449333f8b24"));
  } else {
    await Firebase.initializeApp();
  }
}

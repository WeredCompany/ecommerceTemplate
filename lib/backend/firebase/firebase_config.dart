import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyBv7IcsDiPOzrMzlfhRvn7BJAEyQTTJgd0",
            authDomain: "slap-4ab7e.firebaseapp.com",
            projectId: "slap-4ab7e",
            storageBucket: "slap-4ab7e.appspot.com",
            messagingSenderId: "356287096174",
            appId: "1:356287096174:web:bc56d0cd59561d15f68d7f",
            measurementId: "G-5PQ98WQQH5"));
  } else {
    await Firebase.initializeApp();
  }
}

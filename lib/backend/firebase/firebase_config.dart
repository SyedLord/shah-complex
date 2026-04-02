import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyDEWKlwrqgZ14Ez-wcH-_QQNPqFEYR2NII",
            authDomain: "shah-complex-872k2a.firebaseapp.com",
            projectId: "shah-complex-872k2a",
            storageBucket: "shah-complex-872k2a.firebasestorage.app",
            messagingSenderId: "491007200119",
            appId: "1:491007200119:web:f2a0aae05fb334dcfeef72"));
  } else {
    await Firebase.initializeApp();
  }
}

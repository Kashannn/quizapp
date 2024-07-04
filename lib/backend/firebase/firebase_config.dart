import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: const FirebaseOptions(
            apiKey: "AIzaSyCWjGGF5jHjCwbXa1Ym-mDNNWuiWuGRdLw",
            authDomain: "quizapp-e8016.firebaseapp.com",
            projectId: "quizapp-e8016",
            storageBucket: "quizapp-e8016.appspot.com",
            messagingSenderId: "324224170169",
            appId: "1:324224170169:web:36d5476c5e477a53520368",
            measurementId: "G-VTF41X1E37"));
  } else {
    await Firebase.initializeApp();
  }
}

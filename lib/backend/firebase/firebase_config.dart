import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: const FirebaseOptions(
            apiKey: "AIzaSyBNAMoxcO-ak-1vsxyHsRolGV4nUbIUcq4",
            authDomain: "toowize-e583e.firebaseapp.com",
            projectId: "toowize-e583e",
            storageBucket: "toowize-e583e.appspot.com",
            messagingSenderId: "941103749604",
            appId: "1:941103749604:web:54dd43f278119a26244ff1",
            measurementId: "G-P8C8LB5T64"));
  } else {
    await Firebase.initializeApp();
  }
}

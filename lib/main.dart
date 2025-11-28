import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart'; // Add this import
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'screens/login_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized(); // Ensure this is here
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform, // Add this
  );
  runApp(const MyApp()); // Use const for optimization
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Student Course App',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: LoginScreen(),
    );
  }
}

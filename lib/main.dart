import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cloud_functions/cloud_functions.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:inventory_keeper/src/app.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  const useEmulator = true;
  if (useEmulator) {
    await _connectToFirebaseEmulator();
  }
  runApp(const MyApp());
}

/// Connnect to the firebase emulator for Firestore and Authentication
Future _connectToFirebaseEmulator() async {
  const localHostString = '192.168.204.247';
// You should have the Functions Emulator running locally to use it
  // https://firebase.google.com/docs/functions/local-emulator
  FirebaseFunctions.instance.useFunctionsEmulator(localHostString, 5001);
  FirebaseFirestore.instance.settings = const Settings(
    host: '$localHostString:8080',
    sslEnabled: false,
    persistenceEnabled: false,
  );
}

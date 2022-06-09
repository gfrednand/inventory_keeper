import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cloud_functions/cloud_functions.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:inventory_keeper/src/app.dart';
import 'package:inventory_keeper/src/controllers/auth_controller.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp().then((value) => Get.put(AuthController()));
  const useEmulator = true;
  if (useEmulator) {
    await _connectToFirebaseEmulator();
  }
  runApp(const MyApp());
}

/// Connnect to the firebase emulator for Firestore and Authentication
Future _connectToFirebaseEmulator() async {
  const localHostString = '172.19.17.92';
// You should have the Functions Emulator running locally to use it
  // https://firebase.google.com/docs/functions/local-emulator
  await FirebaseAuth.instance.useAuthEmulator(localHostString, 9099);
  await FirebaseStorage.instance.useStorageEmulator(localHostString, 9199);
  FirebaseFunctions.instance.useFunctionsEmulator(localHostString, 5001);
  FirebaseFirestore.instance.settings = const Settings(
    host: '$localHostString:8080',
    sslEnabled: false,
    persistenceEnabled: true,
  );
}

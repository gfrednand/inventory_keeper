import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cloud_functions/cloud_functions.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get_storage/get_storage.dart';
import 'package:inventory_keeper/src/app.dart';

Future<void> main() async {
  final widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  await Firebase.initializeApp();
  const useEmulator = true;
  if (useEmulator) {
    await _connectToFirebaseEmulator();
  }
  await GetStorage.init();
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

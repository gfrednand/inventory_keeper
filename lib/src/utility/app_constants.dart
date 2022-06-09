import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:inventory_keeper/src/utility/colors.dart';

/// FIREBASE AUTH
FirebaseAuth firebaseAuth = FirebaseAuth.instance;

/// FIREBASE STORAGE
FirebaseStorage firebaseStorage = FirebaseStorage.instance;

/// FIREBASE FIRESTORE
FirebaseFirestore firestore = FirebaseFirestore.instance;

///
BoxDecoration containerBoxDecoration() {
  return BoxDecoration(
    color: Colors.white,
    borderRadius: const BorderRadius.all(Radius.circular(10)),
    boxShadow: [
      BoxShadow(
        color: Colors.grey.withOpacity(0.1),
        spreadRadius: 2,
        blurRadius: 2,
        offset: const Offset(3, 3),
      )
    ],
  );
}

/// Box
BoxDecoration decorationWithGradient() {
  return BoxDecoration(
    borderRadius: const BorderRadius.all(Radius.circular(10)),
    boxShadow: [
      BoxShadow(
        color: Colors.grey.withOpacity(0.1),
        spreadRadius: 2,
        blurRadius: 2,
        offset: const Offset(3, 3),
      )
    ],
    gradient: const LinearGradient(
      begin: Alignment.topRight,
      end: Alignment.bottomLeft,
      colors: [
        AppColors.blue700,
        AppColors.red200,
      ],
    ),
  );
}

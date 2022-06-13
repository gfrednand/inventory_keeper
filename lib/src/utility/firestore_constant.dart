import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';

/// FIREBASE AUTH
FirebaseAuth firebaseAuth = FirebaseAuth.instance;

/// FIREBASE STORAGE
FirebaseStorage firebaseStorage = FirebaseStorage.instance;

/// FIREBASE FIRESTORE
FirebaseFirestore firestore = FirebaseFirestore.instance;

/// Team Collections
CollectionReference teamCollectionRef =
    FirebaseFirestore.instance.collection('team');

/// Team Setting Collections
CollectionReference teamSettingsCollectionRef =
    FirebaseFirestore.instance.collection('teamSettings');

/// User Collections
CollectionReference usersCollectionRef =
    FirebaseFirestore.instance.collection('users');

/// Roles Collections
CollectionReference rolesCollectionRef =
    FirebaseFirestore.instance.collection('roles');

/// Permission Collections
CollectionReference permissionsCollectionRef =
    FirebaseFirestore.instance.collection('permissions');

/// Products Collections
CollectionReference productsCollectionRef =
    FirebaseFirestore.instance.collection('products');

/// Stock Summary Collections
CollectionReference stockSummaryCollectionRef =
    FirebaseFirestore.instance.collection('stockSummary');

/// Product Transaction Collections
CollectionReference productTransactionsCollectionRef =
    FirebaseFirestore.instance.collection('productTransactions');

/// Partner Collections
CollectionReference partnerCollectionRef =
    FirebaseFirestore.instance.collection('partner');

/// Category Collections
CollectionReference categoryCollectionRef =
    FirebaseFirestore.instance.collection('category');

/// Category Collections
CollectionReference updatedAtCollectionRef =
    FirebaseFirestore.instance.collection('updatedAt');

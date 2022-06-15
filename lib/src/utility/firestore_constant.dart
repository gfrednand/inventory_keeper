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
    FirebaseFirestore.instance.collection('teams');

/// Team Setting Collections
CollectionReference teamSettingsCollectionRef(String teamId) =>
    FirebaseFirestore.instance
        .collection('teams')
        .doc(teamId)
        .collection('teamSettings');

/// User Collections
CollectionReference usersCollectionRef =
    FirebaseFirestore.instance.collection('users');

/// Roles Collections
CollectionReference rolesCollectionRef(String teamId) =>
    FirebaseFirestore.instance
        .collection('teams')
        .doc(teamId)
        .collection('roles');

/// Permission Collections
CollectionReference permissionsCollectionRef(String teamId) =>
    FirebaseFirestore.instance
        .collection('teams')
        .doc(teamId)
        .collection('permissions');

/// Products Collections
CollectionReference productsCollectionRef(String teamId) =>
    FirebaseFirestore.instance
        .collection('teams')
        .doc(teamId)
        .collection('products');

/// Stock Summary Collections
CollectionReference stockSummaryCollectionRef(String teamId) =>
    FirebaseFirestore.instance
        .collection('teams')
        .doc(teamId)
        .collection('stockSummaries');

/// Product Transaction Collections
CollectionReference productTransactionsCollectionRef(String teamId) =>
    FirebaseFirestore.instance
        .collection('teams')
        .doc(teamId)
        .collection('productTransactions');

/// Partner Collections
CollectionReference partnerCollectionRef(String teamId) =>
    FirebaseFirestore.instance
        .collection('teams')
        .doc(teamId)
        .collection('partners');

/// Category Collections
CollectionReference categoryCollectionRef(String teamId) =>
    FirebaseFirestore.instance
        .collection('teams')
        .doc(teamId)
        .collection('categories');

/// Category Collections
CollectionReference updatedAtCollectionRef(String teamId) =>
    FirebaseFirestore.instance
        .collection('teams')
        .doc(teamId)
        .collection('updatedAt');

import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fake_cloud_firestore/fake_cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:inventory_keeper/src/api/firebase_repository.dart';
import 'package:inventory_keeper/src/models/product.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  test('test 1', () {
    // The model should be able to receive the following data:
    var product = Product(
      id: 'ABC',
      name: 'Pepsi',
      buyPrice: 500,
      // createdAt: DateTime.now(),
      currentStock: 3,
      salePrice: 800,
    );

    product = product.copyWith(currentStock: 9);

    expect(product.id, 'ABC');
    expect(product.name, 'Pepsi');
    expect(product.buyPrice, 500);
    expect(product.salePrice, 800);
    expect(product.currentStock, 9);
    expect(product.safetyStock, 0);
    expect(product.isIncomingStock, null);
    // expect(product.createdAt, DateTime.now());
  });

  test('should return data when the call to remote source is succesful.',
      () async {
    final fakeFirebaseFirestore = FakeFirebaseFirestore();
    final dataRepository = FireBaseRepository('prodcuts');
    final CollectionReference mockCollectionReference =
        fakeFirebaseFirestore.collection(dataRepository.path);

    final mockProductList = <Product>[];

    for (final mockProduct in mockProductList) {
      await mockCollectionReference.add(mockProduct.toJson());
    }

    final productStreamFromRepository = dataRepository.streamDataCollection();

    final actualProductList = await productStreamFromRepository.first;
    final expectedNoteList = mockProductList;

    expect(actualProductList, expectedNoteList);
  });
}

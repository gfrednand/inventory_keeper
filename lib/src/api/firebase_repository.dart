// ignore: type_annotate_public_apis
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:inventory_keeper/src/api/api.dart';
import 'package:inventory_keeper/src/products/product.dart';

///
class FireBaseRepository
    implements Api<Future<bool>, Product, Future<List<Product>>> {
  ///
  FireBaseRepository(this.path) {
    ref = _db.collection(path);
  }
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  /// Unique path
  final String path;

  /// Cloud firestore reference
  CollectionReference? ref;

  @override
  Future<List<Product>> allItems() async {
    final snapshot = await ref!.get();
    final products = <Product>[];
    for (final doc in snapshot.docs) {
      if (doc.data() != null) {
        // ignore: cast_nullable_to_non_nullable
        final obj = doc.data() as Map<String, dynamic>;
        products.add(Product.fromMap(obj));
      }
    }
    return products;
  }

  @override
  Product oneItem(Product p) {
    final obj = ref!.doc(p.id).get() as Map<String, dynamic>;
    return Product.fromMap(obj);
  }

  @override
  Future<bool> removeOne(Product p) {
    return ref!
        .doc(p.id)
        .delete()
        .then((value) => true)
        .catchError((dynamic error) {
      print("Failed to delete user: $error");
      return false;
    });
  }

  @override
  Future<bool> addOne(Product p) async {
    return ref!
        .add(p.toMap())
        .then((value) => true)
        .catchError((dynamic error) {
      print("Failed to add user: $error");
      return false;
    });
  }

  @override
  Future<bool> updateOne(Product p) {
    return ref!
        .doc(p.id)
        .update(p.toMap())
        .then((value) => true)
        .catchError((dynamic error) {
      print("Failed to update user: $error");
      return false;
    });
  }

  /// Fetching stream of data
  Stream<List<Product>> streamDataCollection() {
    final products = <Product>[];
    return ref!.snapshots().map((snapshot) {
      for (final doc in snapshot.docs) {
        if (doc.data() != null) {
          // ignore: cast_nullable_to_non_nullable
          final obj = doc.data() as Map<String, dynamic>;
          products.add(Product.fromMap(obj));
        }
      }
      return products;
    });
  }
}

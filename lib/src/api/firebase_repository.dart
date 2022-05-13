// ignore: type_annotate_public_apis

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:inventory_keeper/src/api/api.dart';

///
class FireBaseRepository
    implements
        Api<Future<bool>, Map<String, dynamic>,
            Future<List<Map<String, dynamic>>>, Future<Map<String, dynamic>>> {
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
  Future<bool> addMany(List<Map<String, dynamic>> maps) async {
    final batch = _db.batch();

    for (final map in maps) {
      final docRef = ref!.doc(); //automatically generate unique id
      batch.set(docRef, map);
    }
    return batch.commit().then((value) => true).catchError((dynamic error) {
      print('Failed to add: $error');
      return false;
    });
  }

  ///
  Future<bool> updateMany(List<Map<String, dynamic>> maps) async {
    final batch = _db.batch();

    for (final map in maps) {
      final docRef =
          ref!.doc(map['id'] as String); //automatically generate unique id
      batch.update(docRef, map);

      print(map);
    }
    return batch.commit().then((value) => true).catchError((dynamic error) {
      print('Failed to add: $error');
      return false;
    });
  }

  @override
  Future<List<Map<String, dynamic>>> allItems() async {
    final snapshot = await ref!.get();
    final objs = <Map<String, dynamic>>[];
    for (final doc in snapshot.docs) {
      if (doc.data() != null) {
        // ignore: cast_nullable_to_non_nullable
        final obj = doc.data() as Map<String, dynamic>;
        obj['id'] = doc.id;
        objs.add(obj);
      }
    }
    return objs;
  }

  @override
  Future<Map<String, dynamic>> oneItem(Map<String, dynamic> p) async {
    var obj = <String, dynamic>{};
    if (p['id'] != null) {
      obj = await ref!.doc(p['id'] as String).get() as Map<String, dynamic>;
    }
    return obj;
  }

  @override
  Future<bool> removeOne(Map<String, dynamic> p) {
    if (p['id'] != null) {
      return ref!
          .doc(p['id'] as String)
          .delete()
          .then((value) => true)
          .catchError((dynamic error) {
        print('Failed to delete user: $error');
        return false;
      });
    } else {
      return Future<bool>.value(false);
    }
  }

  @override
  Future<bool> addOne(Map<String, dynamic> p) async {
    return ref!.add(p).then((value) => true).catchError((dynamic error) {
      print('Failed to add user: $error');
      return false;
    });
  }

  @override
  Future<bool> updateOne(Map<String, dynamic> p) {
    if (p['id'] != null) {
      return ref!
          .doc(p['id'] as String)
          .update(p)
          .then((value) => true)
          .catchError((dynamic error) {
        print('Failed to update user: $error');
        return false;
      });
    } else {
      return Future<bool>.value(false);
    }
  }

  /// Fetching stream of data
  Stream<List<Map<String, dynamic>>> streamDataCollection({String? query}) {
    print('YEAH');
    if (query != null) {
      return ref!.where('name', isEqualTo: query).snapshots().map(mapFunction);
    }

    final snapshots = ref!.snapshots();
    return snapshots.map(mapFunction);
  }

  ///
  List<Map<String, dynamic>> mapFunction(QuerySnapshot<Object?> asyncSnapshot) {
    // print('JAMANI ${asyncSnapshot}');
    // final docSnapshot = asyncSnapshot.docChanges;
    //  for (final change in docSnapshot) {
    //    change.
    //  }
    // if (asyncSnapshot.docChanges.isNotEmpty) {}
    final objs = <Map<String, dynamic>>[];

    for (final doc in asyncSnapshot.docs) {
      // print('JAMANI ${doc.data()}');
      final obj = doc.data() as Map<String, dynamic>?;
      if (obj != null) {
        obj['id'] = doc.id;
        objs.add(obj);
      }
    }
    return objs;
  }
}


        // final docSnapshot = asyncSnapshot.docChanges;

  
        // for (final change in docSnapshot) {
        //   final obj = change.doc.data() as Map<String, dynamic>?;
        //   print('AAA ${change.doc.exists}');
        //   if (obj != null) {
        //     switch (change.type) {
        //       case DocumentChangeType.added:
        //         obj['id'] = change.doc.id;
        //         obj['added'] = true;
        //         objs.add(obj);
        //         break;
        //       case DocumentChangeType.modified:
        //         obj['id'] = change.doc.id;
        //         obj['modified'] = true;
        //         objs.add(obj);
        //         break;
        //       case DocumentChangeType.removed:
        //         break;
        //     }
        //   }
        // }
        

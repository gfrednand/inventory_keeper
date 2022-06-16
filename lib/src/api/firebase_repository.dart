// // ignore: type_annotate_public_apis

// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:inventory_keeper/src/api/api.dart';

// ///
// enum QueryWhereCondition {
//   ///
//   isEqualTo,

//   ///
//   isNotEqualTo,

//   ///
//   isLessThan,

//   ///
//   isLessThanOrEqualTo,

//   ///
//   isGreaterThan,

//   ///
//   isGreaterThanOrEqualTo,

//   ///
//   arrayContains,

//   ///
//   arrayContainsAny,

//   ///
//   whereIn,

//   ///
//   whereNotIn,

//   ///
//   isNull,
// }

// ///
// class FireBaseRepository
//     implements
//         Api<Future<bool>, Map<String, dynamic>,
//             Future<List<Map<String, dynamic>>>,
// Future<Map<String, dynamic>>> {
//   ///
//   FireBaseRepository(
//     this.path,
//   ) {
//     ref = _db.collection(path);
//   }
//   final FirebaseFirestore _db = FirebaseFirestore.instance;

//   /// Unique path
//   final String path;

//   /// Cloud firestore reference
//   CollectionReference? ref;

//   @override
//   Future<bool> addMany(List<Map<String, dynamic>> maps) async {
//     final batch = _db.batch();

//     for (final map in maps) {
//       final docRef = ref!.doc(); //automatically generate unique id
//       batch.set(docRef, map);
//     }
//     return batch.commit().then((value) => true).catchError((dynamic error) {
//       print('Failed to add: $error');
//       return false;
//     });
//   }

//   ///
//   Future<bool> updateMany(List<Map<String, dynamic>> maps) async {
//     final batch = _db.batch();

//     for (final map in maps) {
//       final docRef =
//           ref!.doc(map['id'] as String); //automatically generate unique id
//       batch.update(docRef, map);
//     }
//     return batch.commit().then((value) => true).catchError((dynamic error) {
//       print('Failed to add: $error');
//       return false;
//     });
//   }

//   @override
//   Future<List<Map<String, dynamic>>> allItems({
//     QueryWhereCondition? condition,
//     Map<String, dynamic>? queryMap,
//   }) async {
//     QuerySnapshot<Object?>? snapshot;
//     final snapRef = checkCondition(queryMap: queryMap, condition: condition);
//     snapshot = await snapRef.get();
//     final objs = <Map<String, dynamic>>[];
//     for (final doc in snapshot.docs) {
//       if (doc.data() != null) {
//         // ignore: cast_nullable_to_non_nullable
//         final obj = doc.data() as Map<String, dynamic>;
//         obj['id'] = doc.id;
//         objs.add(obj);
//       }
//     }
//     return objs;
//   }

//   @override
//   Future<Map<String, dynamic>> oneItem(Map<String, dynamic> p) async {
//     var obj = <String, dynamic>{};
//     if (p['id'] != null) {
//       obj = await ref!.doc(p['id'] as String).get() as Map<String, dynamic>;
//     }
//     return obj;
//   }

//   @override
//   Future<bool> removeOne(Map<String, dynamic> p) {
//     if (p['id'] != null) {
//       return ref!
//           .doc(p['id'] as String)
//           .delete()
//           .then((value) => true)
//           .catchError((dynamic error) {
//         print('Failed to delete user: $error');
//         return false;
//       });
//     } else {
//       return Future<bool>.value(false);
//     }
//   }

//   @override
//   Future<bool> addOne(Map<String, dynamic> p) async {
//     return ref!.add(p).then((value) => true).catchError((dynamic error) {
//       print('Failed to add data: ${error.toString()}');
//       return false;
//     });
//   }

//   @override
//   Future<bool> updateOne(Map<String, dynamic> p) {
//     if (p['id'] != null) {
//       return ref!
//           .doc(p['id'] as String)
//           .set(p, SetOptions(merge: true))
//           .then((value) => true)
//           .catchError((dynamic error) {
//         print('Failed to update user: $error');
//         return false;
//       });
//     } else {
//       return Future<bool>.value(false);
//     }
//   }

//   ///firebase.firestore().collection("cities").where("timestamp", ">", timestamp);
//   Future<Map<String, dynamic>?> getClosingStockByDate(int date) async {
//     final snapshot =
//         await ref!.where('createdAt', isLessThanOrEqualTo: date).get();
//     if (snapshot.docs.isNotEmpty && snapshot.docs[0].data() != null) {
//       return snapshot.docs[0].data()! as Map<String, dynamic>;
//     }
//     return null;
//   }

//   ///
//   Future<bool> createOrUpdate(
//     Map<String, dynamic> stockMap,
//     String id,
//   ) async {
//     return ref!
//         .doc(id)
//         .set(stockMap)
//         .then((value) => true)
//         .catchError((dynamic error) {
//       print('Failed to update user: $error');
//       return false;
//     });
//   }

//   /// Fetching stream of data
//   Stream<List<Map<String, dynamic>>> streamDataCollection({
//     QueryWhereCondition? condition,
//     Map<String, dynamic>? queryMap,
//   }) {
//     final snapRef = checkCondition(queryMap: queryMap, condition: condition);
//     return snapRef.snapshots().map(mapFunction);
//   }

//   /// Fetching stream of data by document id
//   Stream<Map<String, dynamic>?> streamDataCollectionWhereDoc({
//     required String docId,
//   }) {
//     final snapRef = checkCondition(
//       queryMap: <String, dynamic>{'parameter': docId},
//       condition: QueryWhereCondition.isEqualTo,
//     );
//     return snapRef.snapshots().map(
//           (snapshot) => snapshot.docs.isNotEmpty
//               ? (snapshot.docs.first.data() as Map<String, dynamic>?)
//               : null,
//         );
//   }

//   ///
//   List<Map<String, dynamic>> 
//mapFunction(QuerySnapshot<Object?> asyncSnapshot) {
//     final objs = <Map<String, dynamic>>[];

//     for (final doc in asyncSnapshot.docs) {
//       final obj = doc.data() as Map<String, dynamic>?;
//       if (obj != null) {
//         obj['id'] = doc.id;
//         objs.add(obj);
//       }
//     }
//     return objs;
//   }

//   ///Checking condition for query
//   Query<Object?> checkCondition({
//     Map<String, dynamic>? queryMap,
//     QueryWhereCondition? condition,
//   }) {
//     final usedRef = ref!;

//     if (queryMap != null && condition != null) {
//       switch (condition) {
//         case QueryWhereCondition.isEqualTo:
//           return usedRef.where(
//             '${queryMap['parameter']}',
//             isEqualTo: queryMap['value'],
//           );

//         case QueryWhereCondition.isNotEqualTo:
//           return usedRef.where(
//             '${queryMap['parameter']}',
//             isNotEqualTo: queryMap['value'],
//           );

//         case QueryWhereCondition.isLessThan:
//           return usedRef.where(
//             '${queryMap['parameter']}',
//             isLessThan: queryMap['value'],
//           );

//         case QueryWhereCondition.isLessThanOrEqualTo:
//           return usedRef.where(
//             '${queryMap['parameter']}',
//             isLessThanOrEqualTo: queryMap['value'],
//           );

//         case QueryWhereCondition.isGreaterThan:
//           return usedRef.where(
//             '${queryMap['parameter']}',
//             isGreaterThan: queryMap['value'],
//           );

//         case QueryWhereCondition.isGreaterThanOrEqualTo:
//           return usedRef.where(
//             '${queryMap['parameter']}',
//             isGreaterThanOrEqualTo: queryMap['value'],
//           );

//         case QueryWhereCondition.arrayContains:
//           return usedRef.where(
//             '${queryMap['parameter']}',
//             arrayContains: queryMap['value'],
//           );

//         case QueryWhereCondition.arrayContainsAny:
//           return usedRef.where(
//             '${queryMap['parameter']}',
//             arrayContainsAny: queryMap['value'] as List<Object?>?,
//           );

//         case QueryWhereCondition.whereIn:
//           return usedRef.where(
//             '${queryMap['parameter']}',
//             whereIn: queryMap['value'] as List<Object?>?,
//           );

//         case QueryWhereCondition.whereNotIn:
//           return usedRef.where(
//             '${queryMap['parameter']}',
//             whereNotIn: queryMap['value'] as List<Object?>?,
//           );

//         case QueryWhereCondition.isNull:
//           return usedRef.where(
//             '${queryMap['parameter']}',
//             isNull: queryMap['value'] as bool?,
//           );
//       }
//     } else {
//       return usedRef;
//     }
//   }
// }

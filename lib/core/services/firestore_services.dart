import 'dart:developer';

import 'database_services.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreServices implements DatabaseServices {
  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;

  @override
  Future<void> addData({
    required String path,
    required Map<String, dynamic> data,
    String? documentId,
  }) async {
    if (documentId != null) {
      firebaseFirestore.collection(path).doc(documentId).set(data);
    } else {
      await firebaseFirestore.collection(path).add(data);
    }
  }

  @override
  Future<dynamic> getData({
    required String path,
    String? uid,
    Map<String, dynamic>? query,
  }) async {
    try {
      if (uid != null) {
        var data = await firebaseFirestore.collection(path).doc(uid).get();
        log('i get the data ${data.data()}');
        return data.data(); // Map<String, dynamic>?
      } else {
        Query<Map<String, dynamic>> data = firebaseFirestore.collection(path);
        if (query != null) {
          if (query['orderBy'] != null) {
            var orderBy = query['orderBy'] as String;
            var descending = query['descending'] as bool? ?? false;
            data = data.orderBy(orderBy, descending: descending);
          }
          if (query['limit'] != null) {
            var limit = query['limit'] as int;
            data = data.limit(limit);
          }
        }
        var result = await data.get();
        log('i get the data ${result.docs.map((e) => e.data()).toList()}');
        return result.docs.map((e) => e.data()).toList();
      }
    } catch (e) {
      log('Error is  $e');
    }
  }

  @override
  Future<bool> isDataExit({required String path, required String uid}) async {
    final data = await firebaseFirestore.collection(path).doc(uid).get();
    return data.exists;
  }
}

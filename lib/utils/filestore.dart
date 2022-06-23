import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_doan/model/foods.dart';
import 'package:flutter_doan/model/preferentials.dart';

import '../model/tables.dart';

class FirestoreUtil {
  static const String preferentialsCollection = 'preferentials';
  static const String tablesCollection = 'tables';
  static const String foodsCollection = 'foods';
//preferentials
  static Future<List<Preferentials>> getPreferentials(List<String>? ids) async {
    try {
      final prodyctRef = FirebaseFirestore.instance
          .collection(preferentialsCollection)
          .withConverter<Preferentials>(
              fromFirestore: (snapshot, _) =>
                  Preferentials.fromJson(snapshot.data()!),
              toFirestore: (preferentials, _) => preferentials.toJson());
      QuerySnapshot<Preferentials> preferentialsDoc;
      if (ids != null && ids.isNotEmpty) {
        preferentialsDoc = await prodyctRef.where('id', whereIn: ids).get();
      } else {
        preferentialsDoc = await prodyctRef.get();
      }
      return preferentialsDoc.docs.map((e) => e.data()).toList();
    } on FirebaseException catch (e, stacktrace) {
      log("Error getting the preferentials", stackTrace: stacktrace, error: e);
    }
    return [];
  }

//tables
  static Future<List<Tables>> getTables(List<String>? ids) async {
    try {
      final tableRef = FirebaseFirestore.instance
          .collection(tablesCollection)
          .withConverter<Tables>(
              fromFirestore: (snapshot, _) => Tables.fromJson(snapshot.data()!),
              toFirestore: (tables, _) => tables.toJson());
      QuerySnapshot<Tables> tablesDoc;
      if (ids != null && ids.isNotEmpty) {
        tablesDoc = await tableRef.where('id', whereIn: ids).get();
      } else {
        tablesDoc = await tableRef.get();
      }
      return tablesDoc.docs.map((e) => e.data()).toList();
    } on FirebaseException catch (e, stacktrace) {
      log("Error getting the tables", stackTrace: stacktrace, error: e);
    }
    return [];
  }

  //foods
  static Future<List<Foods>> getFoods(List<String>? ids) async {
    try {
      final tableRef = FirebaseFirestore.instance
          .collection(foodsCollection)
          .withConverter<Foods>(
              fromFirestore: (snapshot, _) => Foods.fromJson(snapshot.data()!),
              toFirestore: (foods, _) => foods.toJson());
      QuerySnapshot<Foods> foodsDoc;
      if (ids != null && ids.isNotEmpty) {
        foodsDoc = await tableRef.where('id', whereIn: ids).get();
      } else {
        foodsDoc = await tableRef.get();
      }
      return foodsDoc.docs.map((e) => e.data()).toList();
    } on FirebaseException catch (e, stacktrace) {
      log("Error getting the foods", stackTrace: stacktrace, error: e);
    }
    return [];
  }
}

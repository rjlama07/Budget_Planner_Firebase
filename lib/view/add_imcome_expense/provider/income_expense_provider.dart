import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:myapp/repository/firebase_auth.dart';
import 'package:myapp/repository/firestore_service.dart';

class IncomeExpenseProvider extends ChangeNotifier {
  bool _isLoading = false;

  FirebaseAuthClass fauth = FirebaseAuthClass();
  FireStoreService store = FireStoreService();

  bool get isLoading => _isLoading;

  Future<void> addIncomeExpense({
    required String? category,
    required String date,
    required String description,
    required String type,
    required double amount,
  }) async {
    setLoader(true);
    try {
      final data = {
        "category": category,
        "date": date,
        "description": description,
        "type": type,
        "uid": fauth.auth.currentUser!.uid,
        "amount": amount,
        "createdAt": DateTime.now().toIso8601String(),
      };
      final userUid = fauth.auth.currentUser!.uid;
      await addtoDatabase(
        data: data,
        collectionName: 'income_expense',
        docName: userUid,
      );
      setLoader(false);
    } catch (e) {
      setLoader(false);
      throw Exception('Failed to add income/expense: $e');
    }
  }

  Future<void> addtoDatabase({
    required Map<String, dynamic> data,
    required String collectionName,
    required String docName,
  }) async {
    try {
      CollectionReference collectionReference =
          FirebaseFirestore.instance.collection(collectionName);

      // Add the data to the collection
      await collectionReference.add(data);
    } catch (e) {
      throw Exception('Failed to add data to Firestore: $e');
    }
  }

  setLoader(bool value) {
    _isLoading = value;
    notifyListeners();
  }
}

final incomeExpenseProvider = ChangeNotifierProvider<IncomeExpenseProvider>(
    (ref) => IncomeExpenseProvider());

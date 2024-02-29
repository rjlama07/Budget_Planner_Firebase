import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:myapp/repository/firestore_service.dart';

class UserDataProvider extends ChangeNotifier {
  final FireStoreService _firestoreService = FireStoreService();

  User? user = FirebaseAuth.instance.currentUser;

  UserDataProvider() {
    if (user != null) {
      fetchUserData(user!.uid);
    }
  }

  double _totalIncome = 0;
  double _totalExpense = 0;

  double get totalIncome => _totalIncome;
  double get totalExpense => _totalExpense;

  void updateUserData() {
    fetchUserData(user!.uid);
  }

  Future<void> fetchUserData(String userId) async {
    try {
      final incomeDocs = await _firestoreService.getIncomeData(userId);
      final expenseDocs = await _firestoreService.getExpenseData(userId);

      double incomeSum = 0;
      double expenseSum = 0;

      // Calculate total income
      for (var doc in incomeDocs) {
        incomeSum += double.parse((doc['amount']).toString());
      }

      // Calculate total expense
      for (var doc in expenseDocs) {
        expenseSum += double.parse((doc['amount']).toString());
      }

      _totalIncome = incomeSum;
      _totalExpense = expenseSum;

      notifyListeners();
    } catch (e) {
      throw Exception('Failed to fetch user data: $e');
    }
  }
}

final userDataProvider = ChangeNotifierProvider<UserDataProvider>((ref) {
  return UserDataProvider();
});

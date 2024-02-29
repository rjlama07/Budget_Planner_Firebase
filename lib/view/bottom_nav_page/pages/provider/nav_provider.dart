import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ButtomNavProvider extends ChangeNotifier {
  int _currentIndex = 0;
  int get currentIndex => _currentIndex;

  void changeIndex(int index) {
    _currentIndex = index;
    notifyListeners();
  }

  Color getColor(int index) {
    if (index == _currentIndex) {
      return Colors.blue;
    } else {
      return Colors.grey;
    }
  }
}

final navProvider=ChangeNotifierProvider<ButtomNavProvider>((ref) => ButtomNavProvider());
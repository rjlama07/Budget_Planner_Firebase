import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:myapp/repository/firebase_auth.dart';
import 'package:myapp/repository/firestore_service.dart';

class AuthProvider extends ChangeNotifier {
  bool _isLoading = false;
  UserCredential? _userCredential;
  Map<String, dynamic> _userData = {};
  FirebaseAuthClass fauth = FirebaseAuthClass();
  FireStoreService store = FireStoreService();

  bool get isLoading => _isLoading;
  UserCredential? get userCredential => _userCredential;
  Map<String, dynamic> get userData => _userData;

  Future<UserCredential> loginUserWithFirebase(
      String email, String password) async {
    setLoader(true);
    try {
      _userCredential = await fauth.loginUserWithFirebsae(email, password);
      return _userCredential!;
    } catch (e) {
      print(e);
      setLoader(false);
      return Future.error(e);
    }
  }

  Future<UserCredential> signUpUserWithFirebase(
      String email, String password, String name) async {
    setLoader(true);

    bool isSucess = false;
    _userCredential = await fauth.signUpUserWithFirebase(email, password, name);
    final data = {
      "name": name,
      "email": email,
      "uid": _userCredential!.user!.uid,
      "createdAt": DateTime.now().toIso8601String(),
      'bio': "",
      'profileImage': '',
    };
    String user = fauth.auth.currentUser!.uid;
    isSucess =
        await addtoDatabase(data: data, collectionName: 'user', docName: user);
    if (isSucess) {
      return _userCredential!;
    } else {
      throw Exception('Data not added to database');
    }
  }

  Future<bool> addtoDatabase({
    required Map<String, dynamic> data,
    required String collectionName,
    required String docName,
  }) async {
    bool value = false;

    try {
      await store.addDatatoFireStore(data, "user", "user");
      value = true;
    } catch (e) {
      print(e);
      value = false;
    }
    return value;
  }

  setLoader(bool value) {
    _isLoading = value;
    notifyListeners();
  }
}

final authPorvider =
    ChangeNotifierProvider<AuthProvider>((ref) => AuthProvider());

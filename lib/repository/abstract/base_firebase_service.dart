import 'package:firebase_auth/firebase_auth.dart';

abstract class BaseFirebaseService{
  Future<UserCredential> loginUserWithFirebsae(String email, String password);
  Future<UserCredential> signUpUserWithFirebase(String email, String password,String name);
  void signOutUser();
  bool isUserLoggedIn();
}
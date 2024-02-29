import 'package:firebase_auth/firebase_auth.dart';
import 'package:myapp/repository/abstract/base_firebase_service.dart';

class FirebaseAuthClass extends BaseFirebaseService {
  FirebaseAuth auth = FirebaseAuth.instance;

  @override
  Future<UserCredential> loginUserWithFirebsae(String email, String password) {
    final userCredentail =
        auth.signInWithEmailAndPassword(email: email, password: password);

    return userCredentail;
  }

  @override
  Future signOutUser() async{
   await auth.signOut();
  }

  @override
  bool isUserLoggedIn() {
    if(auth.currentUser != null){
      return true;
    }
    else{
      return false;
    }
  }

  @override
  Future<UserCredential> signUpUserWithFirebase(
      String email, String password, String name) {
    final userCredentail =
        auth.createUserWithEmailAndPassword(email: email, password: password);
    return userCredentail;
  }
}

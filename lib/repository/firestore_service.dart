import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:myapp/repository/abstract/base_firestore_service.dart';

class FireStoreService extends BaseFireStoreServie {
  final fireStore = FirebaseFirestore.instance;
  @override
  Future addDatatoFireStore(
      Map<String, dynamic> data, String collectionName, String docName) async {
    try {
      await fireStore.collection(collectionName).doc(docName).set(data);
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  @override
  Future updateDatatoFireStore(
      Map<String, dynamic> data, String collectionName, String docName) async {
    try {
      fireStore
          .collection(collectionName)
          .doc(docName)
          .update(data)
          .then((value) => print(collectionName))
          .catchError((error) => print(error.toString()));
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  @override
  Future getUserDataFromFireBase(String collectionName, String docName) async {
    try {
     
          await fireStore.collection(collectionName).doc(docName).get();
    } catch (e) {
      throw Exception(e.toString());
    }
  }


  Future<List<DocumentSnapshot>> getIncomeData(String userId) async {
    try {
      QuerySnapshot querySnapshot = await fireStore
          .collection('income_expense')
          .where('uid', isEqualTo: userId)
          .where('type', isEqualTo: 'income')
          .get();

      return querySnapshot.docs;
    } catch (e) {
      throw Exception('Failed to get income data: $e');
    }
  }

  Future<List<DocumentSnapshot>> getExpenseData(String userId) async {
    try {
      QuerySnapshot querySnapshot = await fireStore
          .collection('income_expense')
          .where('uid', isEqualTo: userId)
          .where('type', isEqualTo: 'expense')
          .get();

      return querySnapshot.docs;
    } catch (e) {
      throw Exception('Failed to get expense data: $e');
    }
  }
}

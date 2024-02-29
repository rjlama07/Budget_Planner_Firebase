abstract class BaseFireStoreServie{
  Future addDatatoFireStore(Map<String, dynamic> data, String collectionName,String docName);
  Future updateDatatoFireStore(Map<String, dynamic> data, String collectionName,String docName);
  Future getUserDataFromFireBase(String collectionName,String docName);
}
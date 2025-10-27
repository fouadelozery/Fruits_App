import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce/core/services/database_service.dart';

class FireStoreServices implements DatabaseService {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  @override
  Future<void> addData({
    required String path,
    required Map<String, dynamic> data,
    String? id,
  }) async {
    if (id != null) {
      await firestore.collection(path).doc(id).set(data);
    } else {
      await firestore.collection(path).add(data);
    }
  }

  @override
  Future<dynamic> getData({
    required String path,
    String? uid,
  }) async {
    if (uid != null) {
      var data = await firestore.collection(path).doc(uid).get();
      return data.data() ;
    } else {
      var data = await firestore.collection(path).get();
      return data.docs.map((doc) => doc.data()).toList();
    }
  }
}

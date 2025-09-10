import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce/core/services/database_service.dart';

class FireStoreServices implements DatabaseService {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  @override
  Future<void> addData({
    required String path,
    required Map<String, dynamic> data,
    String  ? id
  }) async {
    if (id != null) {
  await firestore.collection(path).doc(id).set(data);
}
else{
  await firestore.collection(path).add(data);
}
  }

  @override

  Future<Map<String,dynamic>> getData({
    required String path,
    required String uid,
  }) async {
    var data = await firestore.collection(path).doc(uid).get();
    return data.data() as Map<String, dynamic>;
  }
}

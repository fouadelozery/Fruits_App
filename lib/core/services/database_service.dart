
abstract class DatabaseService {
  Future<void> addData({
    required String path,
    required Map<String, dynamic> data,
    String ? id
  });
  Future<dynamic> getData({required String path, required String uid , });
}

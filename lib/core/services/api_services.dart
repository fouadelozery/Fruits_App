import 'package:dio/dio.dart';

class ApiServices {
  final Dio dio = Dio();
  Future<Response> postData({
    required String url,
    required body,
    required String token,
    String? ContentType,
  }) async {
    try {
      final response = await dio.post(
        url,
        data: body,
        options: Options(
          headers: {
            'Authorization': 'Bearer $token',
            'Content-Type': Headers.formUrlEncodedContentType,
          },
        ),
      );
      return response;
    } catch (e) {
      rethrow;
    }
  }
}

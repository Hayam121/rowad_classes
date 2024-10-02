import 'package:dio/dio.dart';

class ApiClient {
  final Dio dio;

  ApiClient(this.dio) {
    dio.options.baseUrl = "http://192.168.20.46:8000";
    dio.options.headers = {
      'Content-Type': 'application/json',
    };
  }

  // دالة لتحديث التوكن في الرأس
  void setToken(String token) {
    dio.options.headers['Authorization'] = 'Bearer $token';
  }

  Future<Response> post(String path, Map<String, dynamic> data) async {
    return dio.post(path, data: data);
  }

  Future<Response> get(String path) async {
    return dio.get(path);
  }
}

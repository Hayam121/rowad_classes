// token_storage.dart
import 'package:shared_preferences/shared_preferences.dart';

// لتخزين التوكن
Future<void> storeToken(String token) async {
  final prefs = await SharedPreferences.getInstance();
  await prefs.setString('token', token);
}

// لاسترجاع التوكن
Future<String?> getToken() async {
  final prefs = await SharedPreferences.getInstance();
  return prefs.getString('token');
}

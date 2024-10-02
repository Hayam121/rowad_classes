import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rowad_classes/data/api_client.dart';
import 'package:rowad_classes/data/endpoints.dart'; // استيراد ملف نقاط النهاية
import 'package:rowad_classes/data/token_storage.dart';
import 'package:rowad_classes/errors/exceptions.dart'; // استيراد ملف الأخطاء

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  final ApiClient apiClient;

  AuthCubit(this.apiClient) : super(AuthInitial());

  Future<void> login(String username, String password) async {
    emit(AuthLoading());
    try {
      final response = await apiClient.post(Endpoints.login, {
        'username': username,
        'password': password,
      });
      if (response.statusCode == 200) {
        final token = response.data['token']; // تأكد من أنك تحصل على التوكن من الاستجابة
        await storeToken(token); // تخزين التوكن
        apiClient.setToken(token); // تحديث التوكن في ApiClient
        
        emit(AuthSuccess());
      } 
      else {
        throw ServerException('Login failed with status code: ${response.statusCode}');
      }
    } on NetworkException catch (e) {
      emit(AuthFailure('Network error: ${e.message}'));
    } on ServerException catch (e) {
      emit(AuthFailure('Server error: ${e.message}'));
    } catch (e) {
      emit(AuthFailure('Unexpected error: $e'));
    }
  }

  Future<void> register({
  required String username,
  required String email,
  required String password,
  required String fname,
  required String lname,
  required String mname,
  required String gender,
  required int phone,
  required String religion,
  required String nationalId,
  required String confirmPassword,
  String? trainingCourse,
  DateTime? dateOfBirth,
  required int province, // تأكد من أن province موجود هنا
}) async {
  emit(AuthLoading());
  try {
    final response = await apiClient.post(Endpoints.registerStudent, {
      'username': username,
      'email': email,
      'password': password,
      'fname': fname,
      'lname': lname,
      'mname': mname,
      'national_id': nationalId,
      'date_of_birth': dateOfBirth != null ? '${dateOfBirth.year}-${dateOfBirth.month}-${dateOfBirth.day}' : null,
      'gender': gender,
      'course': trainingCourse,
      'phone': phone,
      'religion': religion,
      'confirm_password': confirmPassword,
      'province': province
    });
    if (response.statusCode == 200) {
      emit(AuthSuccess());
    } else {
      throw ServerException('Registration failed');
    }
  } on ServerException catch (e) {
    emit(AuthFailure('Server error: ${e.message}'));
  } catch (e) {
    emit(AuthFailure('Unexpected error: $e'));
  }
}

Future<List<Map<String, String>>> fetchAllCourses() async {
  try {
    final response = await apiClient.get(Endpoints.getAllCourses);
    if (response.statusCode == 200) {
      // تحويل البيانات إلى قائمة من الخرائط مع 'id' و 'name'
      return List<Map<String, String>>.from(
        response.data.map((course) => {
          'id': course['id'].toString(), // تأكد من أن 'id' هو المفتاح الصحيح
          'name': course['courseName'],   // تأكد من أن 'courseName' هو المفتاح الصحيح
        }),
      );
    } else {
      throw ServerException('Failed to load courses');
    }
  } catch (e) {
    throw Exception('Error fetching courses: $e');
  }
}


}

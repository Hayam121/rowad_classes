import 'dart:convert';

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
  required String phone,
  required String religion,
  required String nationalId,
  required String confirmPassword,
  String? trainingCourse,
  DateTime? dateOfBirth,
  required String province, // تأكد من أن province موجود هنا
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
  } on NetworkException catch (e) {
      emit(AuthFailure('Network error: ${e.message}'));
    } on ServerException catch (e) {
      emit(AuthFailure('Server error: ${e.message}'));
    } catch (e) {
      emit(AuthFailure('Unexpected error: $e'));
    }
}



  Future<void> fetchAllCourses() async {
  final response = await apiClient.get(Endpoints.getAllCourses);
  
  // Print the entire response data
  print('Response data: ${json.encode(response.data)}');

  if (response.statusCode == 200) {
    // Accessing the 'success' key from the response data
    final List<dynamic> courseData = response.data['success'];

    // Convert to List<Map<String, dynamic>>
    List<Map<String, dynamic>> courses = courseData.map((course) => {
      'id': course['id'].toString(), // Ensure id is a string
      'name': course['name'] as String // Cast name to String
    }).toList();

    // Emit loaded courses
    emit(CoursesLoaded(courses)); // This should now work
  } else {
    // Print error message if status code is not 200
    print('Error: ${response.statusMessage}');
    emit(CoursesError(response.statusMessage ?? 'An unknown error occurred'));
  }
}



}

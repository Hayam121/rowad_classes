// import 'package:dio/dio.dart';
// import 'package:rowad_classes/models/user_model.dart';

// class UserService {
//   final Dio _dio = Dio();

//   Future<UserModel> registerUser(String name, String email, String password) async {
//     final response = await _dio.post('https://example.com/api/register', data: {
//       'name': name,
//       'email': email,
//       'password': password,
//     });

//     return UserModel.fromJson(response.data);
//   }
// }
part of 'auth_cubit.dart';


abstract class AuthState {}

class AuthInitial extends AuthState {}

class AuthLoading extends AuthState {}

class AuthSuccess extends AuthState {}

class AuthFailure extends AuthState {
  final String error;
  AuthFailure(this.error);
}

// Define CoursesLoaded as a subclass of AuthState
class CoursesLoaded extends AuthState {
  final List<Map<String, dynamic>> courses; // Keep it dynamic if the type can vary

  CoursesLoaded(this.courses);
}

class CoursesError extends AuthState {
  final String? error; // Nullable error message
  CoursesError(this.error);
}

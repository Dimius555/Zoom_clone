part of 'auth_cubit.dart';

class AuthState {
  final AuthStatus status;
  final String? message;

  AuthState({required this.status, this.message});

  AuthState copyWith({AuthStatus? status, String? message}) {
    return AuthState(status: status ?? this.status, message: message ?? this.message);
  }
}

part of 'login_bloc.dart';

class LoginState /* extends Equatable*/ {
  const LoginState({
    this.message = '',
    this.status = LoadStatus.initial,
  });

  final String message;
  final LoadStatus status;

  LoginState copyWith({
    LoadStatus? status,
    String? email,
    String? message,
  }) {
    return LoginState(
      status: status ?? this.status,
      message: message ?? this.message,
    );
  }

  @override
  List<Object?> get props => [
        message,
        status,
      ];
}

class LoginSuccessState extends LoginState {}

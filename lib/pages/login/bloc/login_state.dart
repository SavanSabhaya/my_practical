part of 'login_bloc.dart';

class LoginState /* extends Equatable*/ {
  LoginState({
    this.message = '',
    this.status = LoadStatus.initial,
    this.data,
  });

  final String message;
  final LoadStatus status;
  Data? data;

  LoginState copyWith({
    LoadStatus? status,
    String? email,
    String? message,
    Data? data,
  }) {
    return LoginState(
      status: status ?? this.status,
      message: message ?? this.message,
      data: data ?? this.data,
    );
  }

  @override
  List<Object?> get props => [
        message,
        status,
        data,
      ];
}

class LoginSuccessState extends LoginState {}

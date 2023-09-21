part of 'login_bloc.dart';

sealed class LoginEvent extends Equatable {
  const LoginEvent();

  @override
  List<Object> get props => [];
}

class ValidateEvent extends LoginEvent {
  final String email;
  final String password;
  const ValidateEvent(this.email, this.password);
}

part of 'register_bloc.dart';

class RegisterEvent extends Equatable {
  const RegisterEvent();

  @override
  List<Object> get props => [];
}

class ValidateEvent extends RegisterEvent {
  final String name;
  final String number;
  final String email;
  final String password;
  final String cnfPassword;
  ValidateEvent(
      this.name, this.number, this.email, this.password, this.cnfPassword);
}

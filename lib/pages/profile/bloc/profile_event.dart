part of 'profile_bloc.dart';

class ProfileEvent extends Equatable {
  const ProfileEvent();

  @override
  List<Object> get props => [];
}

class ValidateEvent extends ProfileEvent {
  final String name;
  final String number;
  final String email;
  final String password;
  final String cnfPassword;
  ValidateEvent(
      this.name, this.number, this.email, this.password, this.cnfPassword);
}

class ProfileInitEvent extends ProfileEvent {}

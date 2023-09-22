part of 'register_bloc.dart';

class RegisterEvent extends Equatable {
  const RegisterEvent();

  @override
  List<Object> get props => [];
}

class ValidateEvent extends RegisterEvent {
  final String name;
  final int number;
  final String email;
  final String password;
  final String cnfPassword;
  final String compnayName;
  final String address;
  final XFile? zoneImage;

  ValidateEvent(this.name, this.number, this.email, this.password, this.cnfPassword, this.compnayName, this.address,
      this.zoneImage);
}

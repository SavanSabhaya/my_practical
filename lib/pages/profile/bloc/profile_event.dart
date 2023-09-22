part of 'profile_bloc.dart';

class ProfileEvent extends Equatable {
  const ProfileEvent();

  @override
  List<Object> get props => [];
}

class ValidateEvent extends ProfileEvent {
  final String name;
  final String cpname;

  final String number;
  final String email;
  final XFile? profileImage;

  ValidateEvent(this.name, this.cpname, this.number, this.email, this.profileImage);
}

class ProfileInitEvent extends ProfileEvent {}

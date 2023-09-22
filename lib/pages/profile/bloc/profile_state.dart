part of 'profile_bloc.dart';

class ProfileState extends Equatable {
  ProfileState({
    this.message = '',
    this.status = LoadStatus.initial,
    this.user,
  });

  final String message;
  final LoadStatus status;
  User? user;

  ProfileState copyWith({
    LoadStatus? status,
    String? email,
    String? message,
    User? user,
  }) {
    return ProfileState(
      status: status ?? this.status,
      message: message ?? this.message,
      user: user ?? this.user,
    );
  }

  @override
  List<Object?> get props => [
        message,
        status,
        user,
      ];
}

final class ProfileInitial extends ProfileState {}

class ProfileInitstate extends ProfileState {
  User? user;
  ProfileInitstate(this.user);
}

class updateState extends ProfileState {}

part of 'profile_bloc.dart';

class ProfileState extends Equatable {
  const ProfileState({
    this.message = '',
    this.status = LoadStatus.initial,
  });

  final String message;
  final LoadStatus status;

  ProfileState copyWith({
    LoadStatus? status,
    String? email,
    String? message,
  }) {
    return ProfileState(
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

final class ProfileInitial extends ProfileState {}

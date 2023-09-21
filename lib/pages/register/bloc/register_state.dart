part of 'register_bloc.dart';

class RegisterState extends Equatable {
  const RegisterState({
    this.message = '',
    this.status = LoadStatus.initial,
  });

  final String message;
  final LoadStatus status;

  RegisterState copyWith({
    LoadStatus? status,
    String? email,
    String? message,
  }) {
    return RegisterState(
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

class RegisterInitial extends RegisterState {}

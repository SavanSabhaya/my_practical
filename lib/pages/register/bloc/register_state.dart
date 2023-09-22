part of 'register_bloc.dart';

class RegisterState extends Equatable {
  RegisterState({
    this.message = '',
    this.status = LoadStatus.initial,
    this.data,
  });

  final String message;
  final LoadStatus status;
  Data? data;

  RegisterState copyWith({
    LoadStatus? status,
    String? email,
    String? message,
    Data? data,
  }) {
    return RegisterState(
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

class RegisterInitial extends RegisterState {}

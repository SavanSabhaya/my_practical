part of 'dashbord_bloc.dart';

class DashbordState extends Equatable {
  DashbordState({
    this.message = '',
    this.status = LoadStatus.initial,
    this.data,
  });

  final String message;
  final LoadStatus status;
  Data? data;

  DashbordState copyWith({
    LoadStatus? status,
    String? email,
    String? message,
    Data? data,
  }) {
    return DashbordState(
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

final class DashbordInitial extends DashbordState {}

part of 'lead_page_bloc.dart';

class LeadPageState extends Equatable {
  LeadPageState({
    this.message = '',
    this.status = LoadStatus.initial,
  });

  final String message;
  final LoadStatus status;

  LeadPageState copyWith({
    LoadStatus? status,
    String? email,
    String? message,
  }) {
    return LeadPageState(
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

final class LeadPageInitial extends LeadPageState {}

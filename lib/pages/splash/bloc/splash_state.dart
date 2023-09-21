part of 'splash_bloc.dart';

class SplashState /* extends Equatable */ {
  final String? message;
  final bool change;
  SplashState({
    this.message,
    this.change = true,
  });

  SplashState copywith({
    String? message,
    bool? change,
  }) {
    return SplashState(
      message: message ?? this.message,
      change: change ?? this.change,
    );
  }

  @override
  List<Object?> get props => [
        message,
        change,
      ];
}

class SplashInitialState extends SplashState {}

class SplashNavigateState extends SplashState {}

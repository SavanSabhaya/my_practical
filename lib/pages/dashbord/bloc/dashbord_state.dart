part of 'dashbord_bloc.dart';

sealed class DashbordState extends Equatable {
  const DashbordState();
  
  @override
  List<Object> get props => [];
}

final class DashbordInitial extends DashbordState {}

part of 'dashbord_bloc.dart';

class DashbordEvent extends Equatable {
  const DashbordEvent();

  @override
  List<Object> get props => [];
}

class InitEvent extends DashbordEvent {
  final Map<String, dynamic> data;
  InitEvent(this.data);
}

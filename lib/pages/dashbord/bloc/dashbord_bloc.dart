import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'dashbord_event.dart';
part 'dashbord_state.dart';

class DashbordBloc extends Bloc<DashbordEvent, DashbordState> {
  DashbordBloc() : super(DashbordInitial()) {
    on<DashbordEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}

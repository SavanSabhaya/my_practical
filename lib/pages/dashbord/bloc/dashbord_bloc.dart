import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:practical/pages/register/model.dart';

import '../../../common/enums/loading_status.dart';

part 'dashbord_event.dart';
part 'dashbord_state.dart';

class DashbordBloc extends Bloc<DashbordEvent, DashbordState> {
  DashbordBloc() : super(DashbordInitial()) {
    on<DashbordEvent>((event, emit) {
      // TODO: implement event handler
    });
    on<InitEvent>(initevent);
  }

  FutureOr<void> initevent(InitEvent event, Emitter<DashbordState> emit) {
    emit(state.copyWith(data: event.data['getData']));
  }
}

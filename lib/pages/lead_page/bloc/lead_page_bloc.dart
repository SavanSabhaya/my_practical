import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'lead_page_event.dart';
part 'lead_page_state.dart';

class LeadPageBloc extends Bloc<LeadPageEvent, LeadPageState> {
  LeadPageBloc() : super(LeadPageInitial()) {
    on<LeadPageEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}

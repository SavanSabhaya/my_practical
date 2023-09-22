import 'dart:async';
import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:practical/api_service/api_constant.dart';
import 'package:practical/common/enums/loading_status.dart';
import 'package:http/http.dart' as http;
import 'package:practical/pages/lead_page/model.dart';

part 'lead_page_event.dart';
part 'lead_page_state.dart';

class LeadPageBloc extends Bloc<LeadPageEvent, LeadPageState> {
  LeadPageBloc() : super(LeadPageInitial()) {
    on<LeadPageEvent>((event, emit) {
      // TODO: implement event handler
    });
    on<LeadInitEvent>(getleadMethod);
  }

  FutureOr<void> getleadMethod(LeadInitEvent event, Emitter<LeadPageState> emit) {
    getLead(event);
  }

  Future<void> getLead(LeadInitEvent event) async {
    emit(state.copyWith(status: LoadStatus.loading));

    Map<String, String> header = {
      "accept": "application/json",
      "Authorization": "Bearer ${Constants.defaultToken}",
    };

    print("hedder==>${header}");
    final response = await http.get(Uri.parse('https://practical.ouranostech.com/api/lead/get'), headers: header);
    if (response.statusCode == 200) {
      print("response body==>${response.body}");
      LeadResponse jsonResponse = LeadResponse.fromJson(jsonDecode(response.body));
      print('${response.body}');
      if (jsonResponse.status == true) {
        emit(state.copyWith(status: LoadStatus.success, message: jsonResponse.message));
      } else {
        emit(state.copyWith(status: LoadStatus.failure, message: jsonResponse.message));
      }
    }
  }
}

import 'dart:async';
import 'dart:convert';

import 'package:practical/api_service/api_constant.dart';
import 'package:practical/common/enums/loading_status.dart';
import 'package:practical/pages/login/model.dart';
import 'package:practical/pages/register/model.dart';
import 'package:practical/utils/validator.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:http/http.dart' as http;

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(LoginState()) {
    on<LoginEvent>((event, emit) {
      // TODO: implement event handler
    });
    on<ValidateEvent>(_validateEvent);
  }

  FutureOr<void> _validateEvent(ValidateEvent event, Emitter<LoginState> emit) {
    if (Validator.isEmpty(event.email)) {
      emit(state.copyWith(message: 'enter email', status: LoadStatus.validationError));
    } else if (Validator.isEmail(event.email)) {
      emit(state.copyWith(message: "enter valid email", status: LoadStatus.validationError));
    } else if (Validator.isEmpty(event.password)) {
      emit(state.copyWith(message: "enter password", status: LoadStatus.validationError));
    } else {
      userLogin(event);
    }
  }

  Future<void> userLogin(ValidateEvent event) async {
    emit(state.copyWith(status: LoadStatus.loading));

    final params = jsonEncode({
      "email_or_mobile": event.email,
      "password": event.password,
      "device_id": "string",
      "device_type": "string",
      "fcm_token": "string"
    });
    Map<String, String> header = {
      "accept": "application/json",
      "Content-Type": " application/json",
    };
    print('params==>${params}');

    final response =
        await http.post(Uri.parse('https://practical.ouranostech.com/api/login'), body: params, headers: header);

    if (response.statusCode == 200) {
      LoginResponse jsonResponse = LoginResponse.fromJson(jsonDecode(response.body));
      print('${response.body}');
      if (jsonResponse.status == true) {
        Constants.defaultToken = jsonResponse.data?.userToken.toString() ?? "";
        print('token==>${Constants.defaultToken}');
        emit(state.copyWith(status: LoadStatus.success, message: jsonResponse.message, data: jsonResponse.data));
      } else {
        emit(state.copyWith(status: LoadStatus.failure, message: jsonResponse.message));
      }
    }
  }
}

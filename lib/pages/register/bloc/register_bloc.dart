import 'dart:async';
import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:practical/common/enums/loading_status.dart';
import 'package:practical/pages/login/bloc/login_bloc.dart';
import 'package:practical/pages/register/model.dart';
import 'package:practical/utils/validator.dart';
import 'package:http/http.dart' as http;

part 'register_event.dart';
part 'register_state.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  RegisterBloc() : super(RegisterInitial()) {
    on<RegisterEvent>((event, emit) {
      // TODO: implement event handler
    });
    on<ValidateEvent>(validateEvent);
  }
  FutureOr<void> validateEvent(
      ValidateEvent event, Emitter<RegisterState> emit) {
    if (Validator.isEmpty(event.name)) {
      emit(state.copyWith(
          message: 'enter name', status: LoadStatus.validationError));
    } else if (Validator.isEmpty(event.number)) {
      emit(state.copyWith(
          message: 'enter number', status: LoadStatus.validationError));
    } else if (Validator.isEmpty(event.email)) {
      emit(state.copyWith(
          message: 'enter email', status: LoadStatus.validationError));
    } else if (Validator.isEmail(event.email)) {
      emit(state.copyWith(
          message: "enter valid email", status: LoadStatus.validationError));
    } else if (Validator.isEmpty(event.password)) {
      emit(state.copyWith(
          message: "enter password", status: LoadStatus.validationError));
    } else if (Validator.isEmpty(event.cnfPassword)) {
      emit(state.copyWith(
          message: "enter Cnfpassword", status: LoadStatus.validationError));
    } else {
      registerUser(event);
    }
  }

  Future<void> registerUser(ValidateEvent event) async {
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
      "Authorization: Bearer http"
          "Content-Type": " multipart/form-data",
    };
    print('params==>${params}');

    final response = await http.post(
        Uri.parse('http://practical.ouranostech.com/api/registration'),
        body: params,
        headers: header);

    if (response.statusCode == 200) {
      RegisterResponse jsonResponse =
          RegisterResponse.fromJson(jsonDecode(response.body));
      print('${response.body}');
      if (jsonResponse.status == true) {
        emit(state.copyWith(
            status: LoadStatus.success, message: jsonResponse.message));
      } else {
        emit(state.copyWith(
            status: LoadStatus.failure, message: jsonResponse.message));
      }
    }
  }
}

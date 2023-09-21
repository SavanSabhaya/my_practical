import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:practical/api_service/api_constant.dart';
import 'package:practical/common/enums/loading_status.dart';
import 'package:practical/utils/validator.dart';

part 'profile_event.dart';
part 'profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  ProfileBloc() : super(ProfileInitial()) {
    on<ProfileEvent>((event, emit) {});
    on<ProfileInitEvent>(profile);
  }

  FutureOr<void> profile(ProfileInitEvent event, Emitter<ProfileState> emit) {
    getProfile(event);
  }

  FutureOr<void> validateEvent(
      ValidateEvent event, Emitter<ProfileState> emit) {
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
      updateProfile(event);
    }
  }

  Future<void> updateProfile(ValidateEvent event) async {
    emit(state.copyWith(status: LoadStatus.loading));

    Map<String, String> header = {
      "accept": "application/json",
      "Authorization": "Bearer ${Constants.defaultToken}",
    };
    final params = jsonEncode({
      "email_or_mobile": event.email,
      "password": event.password,
      "device_id": "string",
      "device_type": "string",
      "fcm_token": "string"
    });

    print("hedder==>${header}");
    final response = await http.post(
        Uri.parse('http://practical.ouranostech.com/api/profile/update'),
        headers: header);
    print("${response.body}");
    if (response.statusCode == 200) {
      /* RegisterResponse jsonResponse =
          RegisterResponse.fromJson(jsonDecode(response.body));
      print('${response.body}');
      if (jsonResponse.status == true) {
        emit(state.copyWith(
            status: LoadStatus.success, message: jsonResponse.message));
      } else {
        emit(state.copyWith(
            status: LoadStatus.failure, message: jsonResponse.message));
      } */
    }
  }

  Future<void> getProfile(ProfileInitEvent event) async {
    emit(state.copyWith(status: LoadStatus.loading));

    Map<String, String> header = {
      "accept": "application/json",
      "Authorization": "Bearer ${Constants.defaultToken}",
    };

    print("hedder==>${header}");
    final response = await http.get(
        Uri.parse('http://practical.ouranostech.com/api/profile'),
        headers: header);
    print("${response.body}");
    if (response.statusCode == 200) {
      /* RegisterResponse jsonResponse =
          RegisterResponse.fromJson(jsonDecode(response.body));
      print('${response.body}');
      if (jsonResponse.status == true) {
        emit(state.copyWith(
            status: LoadStatus.success, message: jsonResponse.message));
      } else {
        emit(state.copyWith(
            status: LoadStatus.failure, message: jsonResponse.message));
      } */
    }
  }
}

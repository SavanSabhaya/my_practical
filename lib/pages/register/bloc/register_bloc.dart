import 'dart:async';
import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:image_picker/image_picker.dart';
import 'package:practical/common/enums/loading_status.dart';
import 'package:practical/pages/login/bloc/login_bloc.dart';
import 'package:practical/pages/register/model.dart';
import 'package:practical/utils/validator.dart';
import 'package:http/http.dart' as http;
import 'package:path/path.dart' as p;
import 'package:http_parser/http_parser.dart';

part 'register_event.dart';
part 'register_state.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  RegisterBloc() : super(RegisterInitial()) {
    on<RegisterEvent>((event, emit) {
      // TODO: implement event handler
    });
    on<ValidateEvent>(validateEvent);
  }
  FutureOr<void> validateEvent(ValidateEvent event, Emitter<RegisterState> emit) {
    if (Validator.isEmpty(event.name)) {
      emit(state.copyWith(message: 'enter name', status: LoadStatus.validationError));
    } else if (Validator.isEmpty(event.email)) {
      emit(state.copyWith(message: 'enter email', status: LoadStatus.validationError));
    } else if (Validator.isEmail(event.email)) {
      emit(state.copyWith(message: "enter valid email", status: LoadStatus.validationError));
    } else if (Validator.isEmpty(event.password)) {
      emit(state.copyWith(message: "enter password", status: LoadStatus.validationError));
    } else if (Validator.isEmpty(event.cnfPassword)) {
      emit(state.copyWith(message: "enter Cnfpassword", status: LoadStatus.validationError));
    } else {
      registerUser(event);
    }
  }

  Future<void> registerUser(ValidateEvent event) async {
    emit(state.copyWith(status: LoadStatus.loading));
    String fileName = event.zoneImage?.path.split('/').last ?? "";

    FormData formData = FormData.fromMap({
      "full_name": event.name,
      "contactNo": event.number,
      "user_name": event.email,
      "password": event.password,
      "confirm_password": event.cnfPassword,
      "cmpName": event.compnayName,
      "cmp_address": event.address
    });
    final extension = p.extension(event.zoneImage?.path ?? "").replaceAll(".", "");
    formData.files.add(MapEntry(
        'cmp_logo',
        await MultipartFile.fromFile(event.zoneImage?.path ?? "",
            filename: fileName, contentType: MediaType("image", extension))));

    print('formData==>${formData}');
    final response = await Dio().post(
      'https://practical.ouranostech.com/api/registration',
      data: formData,
      options: Options(
        headers: {
          "accept": "application/json",
          "Authorization": "Bearer http",
          "Content-Type": "multipart/form-data",
        },
      ),
    );
    if (response.statusCode == 200) {
      RegisterResponse jsonResponse = RegisterResponse.fromJson((response.data));
      if (jsonResponse.status == true) {
        emit(state.copyWith(status: LoadStatus.success, message: 'Register sucessfully', data: jsonResponse.data));
      } else {
        emit(state.copyWith(status: LoadStatus.failure));
      }
    }
  }
}

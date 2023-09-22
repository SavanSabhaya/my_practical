import 'dart:async';
import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:image_picker/image_picker.dart';
import 'package:practical/api_service/api_constant.dart';
import 'package:practical/common/enums/loading_status.dart';
import 'package:practical/pages/profile/getProfile_model.dart';
import 'package:practical/pages/register/model.dart';
import 'package:practical/utils/validator.dart';
import 'package:path/path.dart' as p;
import 'package:http_parser/http_parser.dart';
part 'profile_event.dart';
part 'profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  ProfileBloc() : super(ProfileInitial()) {
    on<ValidateEvent>(validateEvent);
    on<ProfileInitEvent>(profile);
  }

  FutureOr<void> profile(ProfileInitEvent event, Emitter<ProfileState> emit) {
    getProfile(event);
  }

  FutureOr<void> validateEvent(ValidateEvent event, Emitter<ProfileState> emit) {
    updateUser(event);
  }

  Future<void> updateUser(ValidateEvent event) async {
    emit(state.copyWith(status: LoadStatus.loading));
    String fileName = event.profileImage?.path.split('/').last ?? "";

    FormData formData = FormData.fromMap({
      "full_name": event.name,
      "cmpName": event.cpname,
      "contactNo": event.number,
      "email": event.email,
    });
    final extension = p.extension(event.profileImage?.path ?? "").replaceAll(".", "");
    formData.files.add(MapEntry(
        'profile_image',
        await MultipartFile.fromFile(event.profileImage?.path ?? "",
            filename: fileName, contentType: MediaType("image", extension))));

    print('formData==>${formData}');
    final response = await Dio().post(
      'https://practical.ouranostech.com/api/profile/update',
      data: formData,
      options: Options(
        headers: {
          "accept": "application/json",
          "Authorization": "Bearer ${Constants.defaultToken}",
          "Content-Type": "multipart/form-data",
        },
      ),
    );
    if (response.statusCode == 200) {
      RegisterResponse jsonResponse = RegisterResponse.fromJson((response.data));
      if (jsonResponse.status == true) {
        emit(state.copyWith(status: LoadStatus.success, message: 'profile update sucessfully'));
        emit(updateState());
      } else {
        emit(state.copyWith(status: LoadStatus.failure));
      }
    }
  }

  Future<void> getProfile(ProfileInitEvent event) async {
    emit(state.copyWith(status: LoadStatus.loading));

    Map<String, String> header = {
      "accept": "application/json",
      "Authorization": "Bearer ${Constants.defaultToken}",
    };

    print("hedder==>${header}");
    final response = await http.get(Uri.parse('https://practical.ouranostech.com/api/profile'), headers: header);
    if (response.statusCode == 200) {
      print("response body==>${response.body}");
      ProfileResponse jsonResponse = ProfileResponse.fromJson(jsonDecode(response.body));
      print('${response.body}');
      if (jsonResponse.status == true) {
        emit(state.copyWith(status: LoadStatus.success, message: jsonResponse.message, user: jsonResponse.data?.user));
        emit(ProfileInitstate(jsonResponse.data?.user));
      } else {
        emit(state.copyWith(status: LoadStatus.failure, message: jsonResponse.message));
      }
    }
  }
}

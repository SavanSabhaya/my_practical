import 'dart:io';

import 'package:practical/api_service/api_constant.dart';
import 'package:practical/api_service/dio_client.dart';
import 'package:practical/utils/repository_manager.dart';

import '../common/enums/method_type.dart';

abstract class AuthRepository {}

class AuthRepositoryImpl extends AuthRepository {
  late DioClient _dioClient;

  AuthRepositoryImpl() {
    _dioClient = getIt.get<DioClient>();
  }
}

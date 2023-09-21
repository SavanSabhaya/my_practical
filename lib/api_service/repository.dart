import 'package:practical/api_service/api_constant.dart';
import 'package:practical/api_service/dio_client.dart';
import 'package:practical/api_service/failure_response.dart';
import 'package:practical/common/enums/method_type.dart';
import 'package:dartz/dartz.dart';

class Repository {
  const Repository({required this.dioClient});

  final DioClient dioClient;

  // ▶︎ Init
  Future<Map<String, dynamic>> loginApi(Map<String, dynamic> params) async =>
      await DioClient().request(ApiConstant.login, MethodType.get, params);
}

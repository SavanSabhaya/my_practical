import 'package:practical/api_service/dio_client.dart';
import 'package:practical/repository/auth_repository.dart';
import 'package:get_it/get_it.dart';

import 'shared_preferences.dart';

final getIt = GetIt.instance;

void setup() async {
  getIt.registerLazySingleton<SharePref>(() => SharePref().init());

  getIt.registerLazySingleton<DioClient>(() => DioClient().init());
}

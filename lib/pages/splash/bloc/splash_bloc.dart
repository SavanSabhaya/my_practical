import 'dart:async';

import 'package:practical/common/enums/loading_status.dart';
import 'package:practical/utils/logger_util.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:meta/meta.dart';
import '../../../repository/auth_repository.dart';
import '../../../utils/repository_manager.dart';
part 'splash_event.dart';
part 'splash_state.dart';

class SplashBloc extends Bloc<SplashEvent, SplashState> {
  SplashBloc() : super(SplashInitialState()) {
    on<OpenScreenEvent>(_handleSplashInitEvent);
  }

  Future<void> _handleSplashInitEvent(
    OpenScreenEvent event,
    Emitter<SplashState> emit,
  ) async {
    await Future.delayed(
      const Duration(seconds: 3),
      () {
        emit(SplashNavigateState());
      },
    );
  }
}

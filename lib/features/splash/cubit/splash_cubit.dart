import 'package:auto_route/auto_route.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

import '../../../core/constants/enums/duration_enums.dart';
import '../../../core/constants/navigation/navigation_constants.dart';
import 'splash_state.dart';

class SplashCubit extends Cubit<SplashState> {
  SplashCubit() : super(const SplashState()) {
    checkApplication();
  }
  Future<void> checkApplication() async {
    await Future.delayed(Durations.normal.value);
    emit(state.copyWith(isComplete: true));
  }

  void navigationToOnboarding(BuildContext context) {
    context.router.replaceNamed(NavigationConstants.instance.onboarding);
  }
}

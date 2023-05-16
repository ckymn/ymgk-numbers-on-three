import 'package:auto_route/auto_route.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

import '../../../core/constants/assets/image_constants.dart';
import '../../../core/constants/enums/preferences_keys.dart';
import '../../../core/constants/navigation/navigation_constants.dart';
import '../../../core/init/cache/locale_manager.dart';
import '../model/onboarding_model.dart';
import 'onboard_state.dart';

class OnboardCubit extends Cubit<OnboardState> {
  List<OnBoardModel> onboardingModelList = [];

  OnboardCubit()
      : super(OnboardState(
          currentIndex: 0,
        ));

  void changeCurrentIndex(int value) {
    emit(OnboardState(
      currentIndex: value,
    ));
  }

  void init() {
    onboardingModelList = [
      OnBoardModel(
          'Welcome1',
          '1Lorem ipsum dolor sit amet consectetur. Sagittis adipiscing pulvinar tempor scelerisque erat molestie. Consequat imperdiet viverra aliquam auctor viverra.',
          ImageConstants.instance.onboard1),
      OnBoardModel(
          'Welcome2',
          '2Lorem ipsum dolor sit amet consectetur. Sagittis adipiscing pulvinar tempor scelerisque erat molestie. Consequat imperdiet viverra aliquam auctor viverra.',
          ImageConstants.instance.onboard2),
      OnBoardModel(
          'Welcome3',
          '3Lorem ipsum dolor sit amet consectetur. Sagittis adipiscing pulvinar tempor scelerisque erat molestie. Consequat imperdiet viverra aliquam auctor viverra.',
          ImageConstants.instance.onboard3),
    ];
    emit(OnboardState(
      currentIndex: state.currentIndex,
    ));
  }

  Future<void> navigateToLogin(BuildContext context) async {
     LocaleManager.instance.setBoolValue(PreferencesKeys.SKIP_ONBOARDING, true);
    context.router.replaceNamed(NavigationConstants.instance.game);
  }
}

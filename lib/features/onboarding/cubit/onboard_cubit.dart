import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';

import '../../../core/constants/assets/image_constants.dart';
import '../../../core/constants/assets/svg_constants.dart';
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
          ImageConstants.instance.onboard2),
      OnBoardModel(
          'Welcome2',
          '2Lorem ipsum dolor sit amet consectetur. Sagittis adipiscing pulvinar tempor scelerisque erat molestie. Consequat imperdiet viverra aliquam auctor viverra.',
          SvgConstants.instance.onboard2),
      OnBoardModel(
          'Welcome3',
          '3Lorem ipsum dolor sit amet consectetur. Sagittis adipiscing pulvinar tempor scelerisque erat molestie. Consequat imperdiet viverra aliquam auctor viverra.',
          SvgConstants.instance.onboard3),
    ];
    emit(OnboardState(
      currentIndex: state.currentIndex,
    ));
  }

  void navigateToLogin(BuildContext context) {
  }
}

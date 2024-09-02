import 'dart:async';

import 'package:clean_architecture/domain/model/models.dart';
import 'package:clean_architecture/presentation/base/base_view_model.dart';
import 'package:clean_architecture/presentation/resources/assets_manager.dart';
import 'package:clean_architecture/presentation/resources/strings_manager.dart';

class OnBoardingViewModel
    implements
        BaseViewModel,
        OnBoardingViewModelInput,
        OnBoardingViewModelOutput {
  // stream controllers output
  final StreamController _streamController =
      StreamController<SliderViewObject>();
  late final List<SliderObject> slidesList;
  int _currentIndex = 0;

  // onboarding ViewModel Inputs
  @override
  void dispose() {
    _streamController.close();
  }

  @override
  void start() {
    // view model start user jop
    slidesList = _getSliderDate();
    _postDataToView();
  }

  @override
  int goNext() {
    int nextIndex = ++_currentIndex;
    if (nextIndex == slidesList.length) {
      nextIndex = 0;
    }
    return nextIndex;
  }

  @override
  int goPrevious() {
    int previousIndex = --_currentIndex;
    if (previousIndex == -1) {
      previousIndex = slidesList.length - 1;
    }
    return previousIndex;
  }

  @override
  void onPageChanged(int index) {
    _currentIndex = index;
    _postDataToView();
  }

  @override
  Sink get inputSliderViewObject => _streamController.sink;

  // onboarding ViewModel outputs
  @override
  Stream<SliderViewObject> get outputSliderViewObject =>
      _streamController.stream.map((sliderViewObject) => sliderViewObject);

  // onboarding private functions

  void _postDataToView() {
    _streamController.sink.add(
      SliderViewObject(
          sliderObject: slidesList[_currentIndex],
          currentIndex: _currentIndex,
          numOfSlides: slidesList.length),
    );
  }

  List<SliderObject> _getSliderDate() => [
        SliderObject(
            supTitle: AppStrings.onBoardingSubTitle1,
            title: AppStrings.onBoardingTitle1,
            image: ImageAssets.onboardingLogo1),
        SliderObject(
            supTitle: AppStrings.onBoardingSubTitle2,
            title: AppStrings.onBoardingTitle2,
            image: ImageAssets.onboardingLogo2),
        SliderObject(
            supTitle: AppStrings.onBoardingSubTitle3,
            title: AppStrings.onBoardingTitle3,
            image: ImageAssets.onboardingLogo3),

      ];
}

abstract class OnBoardingViewModelInput {
  void goNext(); //when user clicks on right arrow ir swipe left
  void goPrevious(); //when user clicks on left arrow ir swipe right
  void onPageChanged(int index);
  // stream controllers input
  Sink get inputSliderViewObject;
}

abstract class OnBoardingViewModelOutput {
  Stream<SliderViewObject> get outputSliderViewObject;
}

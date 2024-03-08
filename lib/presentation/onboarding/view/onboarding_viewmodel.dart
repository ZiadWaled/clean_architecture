import 'dart:async';

import 'package:clean_architecture/domain/model/models.dart';
import 'package:clean_architecture/presentation/base/base_view_model.dart';
import 'package:clean_architecture/presentation/resources/assets_manager.dart';
import 'package:clean_architecture/presentation/resources/strings_manager.dart';

class OnBoardingViewModel
    implements
        BaseViewModel,
        OnBoardingViewModelInputs,
        OnBoardingViewModelOutputs {
  late final List<SliderObject> _list;
  int _currentIndex = 0;

  final StreamController _streamController =
      StreamController<SliderViewObject>();

  @override
  void dispose() {
    _streamController.close();
  }

  @override
  void start() {
    _list = _getSliderData();
    _postDataToView();
  }

  @override
  // TODO: implement inputSliderViewObject
  Sink get inputSliderViewObject => _streamController.sink;

  @override
  // TODO: implement outputSliderViewObject
  Stream<SliderViewObject> get outputSliderViewObject =>
      _streamController.stream.map((sliderViewObject) => sliderViewObject);

  // functions
  List<SliderObject> _getSliderData() => [
        SliderObject(
            title: AppStrings.onBoardingTitle1,
            supTitle: AppStrings.onBoardingSubTitle1,
            image: ImageAssets.onboardingLogo1),
        SliderObject(
            title: AppStrings.onBoardingTitle2,
            supTitle: AppStrings.onBoardingSubTitle2,
            image: ImageAssets.onboardingLogo2),
        SliderObject(
            title: AppStrings.onBoardingTitle3,
            supTitle: AppStrings.onBoardingSubTitle3,
            image: ImageAssets.onboardingLogo3),
        SliderObject(
            title: AppStrings.onBoardingTitle4,
            supTitle: AppStrings.onBoardingSubTitle4,
            image: ImageAssets.onboardingLogo4),
      ];
  void _postDataToView() {
    inputSliderViewObject.add(SliderViewObject(
        sliderObject: _list[_currentIndex],
        currentIndex: _currentIndex,
        numOfSlides: _list.length));
  }

  @override
  int goNext() {
    int nextIndex = ++_currentIndex;
    if (nextIndex == _list.length) {
      nextIndex = 0;
    }
    return nextIndex;
  }

  @override
  int goPrevious() {
    int previousIndex = --_currentIndex;
    if (previousIndex == -1) {
      previousIndex = _list.length - 1;
    }
    return previousIndex;
  }

  @override
  void onPageChanged(int index) {
    _currentIndex = index;
    _postDataToView();
  }
}

abstract class OnBoardingViewModelInputs {
  void goNext();
  void goPrevious();
  void onPageChanged(int index);
  Sink get inputSliderViewObject;
}

abstract class OnBoardingViewModelOutputs {
  Stream<SliderViewObject> get outputSliderViewObject;
}

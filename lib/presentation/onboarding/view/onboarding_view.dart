import 'package:clean_architecture/domain/model/models.dart';
import 'package:clean_architecture/presentation/onboarding/viewmodel/onboarding_viewmodel.dart';
import 'package:clean_architecture/presentation/resources/app_router.dart';
import 'package:clean_architecture/presentation/resources/assets_manager.dart';
import 'package:clean_architecture/presentation/resources/color_manager.dart';
import 'package:clean_architecture/presentation/resources/constants_manager.dart';
import 'package:clean_architecture/presentation/resources/routes_manager.dart';
import 'package:clean_architecture/presentation/resources/strings_manager.dart';
import 'package:clean_architecture/presentation/resources/values_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';


class OnBoardingView extends StatefulWidget {
  const OnBoardingView({super.key});
  @override
  State<OnBoardingView> createState() => _OnBoardingViewState();
}

class _OnBoardingViewState extends State<OnBoardingView> {
  final PageController _pageController = PageController();
  final OnBoardingViewModel _viewModel = OnBoardingViewModel();
  _bind() {
    _viewModel.start();
  }

  @override
  void initState() {
    _bind();
    super.initState();
  }

  @override
  void dispose() {
    _viewModel.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: _viewModel.outputSliderViewObject,
        builder: (context, snapshot) {
          return _getContentWidget(snapshot.data);
        });
  }

  Widget _getContentWidget(SliderViewObject? sliderViewObject) {
    if (sliderViewObject == null) {
      return const SizedBox();
    } else {
      return Scaffold(
        backgroundColor: ColorManager.white,
        appBar: AppBar(
          backgroundColor: ColorManager.white,
          elevation: AppSize.s0,
          systemOverlayStyle: SystemUiOverlayStyle(
            statusBarColor: ColorManager.white,
            statusBarIconBrightness: Brightness.dark,
          ),
        ),
        body: PageView.builder(
            itemCount: sliderViewObject.numOfSlides,
            controller: _pageController,
            onPageChanged: (index) {
              _viewModel.onPageChanged(index);
            },
            itemBuilder: (BuildContext context, int index) {
              return OnBoardingPage(sliderViewObject.sliderObject);
            }),
        bottomSheet: Container(
          height: 100,
          color: ColorManager.white,
          child: Column(
            children: [
              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: () {
                    GoRouter.of(context).pushReplacement(AppRouter.kLoginView);
                  },
                  child: Text(
                    AppStrings.skip,
                    textAlign: TextAlign.end,
                    overflow: TextOverflow.clip,
                    style: Theme.of(context).textTheme.labelLarge,
                  ),
                ),
              ),
              _getBottomSheetWidget(sliderViewObject)
            ],
          ),
        ),
      );
    }
  }

  Widget _getBottomSheetWidget(SliderViewObject sliderViewObject) {
    return Container(
      color: ColorManager.primary,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // left arrow
          Padding(
            padding: const EdgeInsets.all(AppPadding.p16),
            child: GestureDetector(
                onTap: () {
                  // go to previous slide
                  _pageController.animateToPage(_viewModel.goPrevious(),
                      duration: const Duration(
                          microseconds: AppConstants.sliderAnimation),
                      curve: Curves.bounceInOut);
                },
                child: SizedBox(
                    width: AppSize.s20,
                    height: AppSize.s20,
                    child: SvgPicture.asset(ImageAssets.leftArrowIc))),
          ),

          // circle indicator
          Row(
            children: [
              for (int i = 0; i < sliderViewObject.numOfSlides; i++)
                Padding(
                  padding: const EdgeInsets.all(AppPadding.p8),
                  child: _getSelectedIndex(i, sliderViewObject.currentIndex),
                ),
            ],
          ),

          // right arrow
          Padding(
            padding: const EdgeInsets.all(AppPadding.p16),
            child: GestureDetector(
                onTap: () {
                  // go to next slide
                  _pageController.animateToPage(_viewModel.goNext(),
                      duration: const Duration(
                          microseconds: AppConstants.sliderAnimation),
                      curve: Curves.bounceInOut);
                },
                child: SizedBox(
                    width: AppSize.s20,
                    height: AppSize.s20,
                    child: SvgPicture.asset(ImageAssets.rightArrowIc))),
          ),
        ],
      ),
    );
  }

  Widget _getSelectedIndex(int index, int currentIndex) {
    if (index == currentIndex) {
      return SvgPicture.asset(ImageAssets.solidCircleIc);
    } else {
      return SvgPicture.asset(ImageAssets.hollowCirlceIc);
    }
  }
}

class OnBoardingPage extends StatelessWidget {
  const OnBoardingPage(this._sliderObject, {super.key});
  final SliderObject _sliderObject;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const SizedBox(height: AppSize.s14),
        Padding(
          padding: const EdgeInsets.all(AppPadding.p8),
          child: Text(
            _sliderObject.title!,
            style: Theme.of(context).textTheme.headlineLarge,
            maxLines: AppConstants.onBoardingMaxLien,
            overflow: TextOverflow.clip,
          ),
        ),
        const SizedBox(height: AppSize.s4),
        Padding(
          padding: const EdgeInsets.all(AppPadding.p8),
          child: Text(
            _sliderObject.supTitle!,
            style: Theme.of(context).textTheme.titleMedium,
            maxLines: AppConstants.onBoardingMaxLien,
            textAlign: TextAlign.center,
            overflow: TextOverflow.clip,
          ),
        ),
        const SizedBox(height: AppSize.s60),
        SvgPicture.asset(_sliderObject.image!)
      ],
    );
  }
}

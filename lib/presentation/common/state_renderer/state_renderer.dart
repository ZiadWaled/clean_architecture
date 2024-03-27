import 'package:clean_architecture/presentation/resources/assets_manager.dart';
import 'package:clean_architecture/presentation/resources/color_manager.dart';
import 'package:clean_architecture/presentation/resources/font_manager.dart';
import 'package:clean_architecture/presentation/resources/strings_manager.dart';
import 'package:clean_architecture/presentation/resources/styles_manager.dart';
import 'package:clean_architecture/presentation/resources/values_manager.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

enum StateRendererType {
// POPUP STATE (DIALOG)
  popupLoadingState,
  popupErrorState,

// FULL SCREEN STATE (FULL SCREEN)
  fullScreenLoadingState,
  fullScreenErrorState,
  fullScreenEmptyState,

  // general
  contentState
}

class StateRenderer extends StatelessWidget {
  StateRendererType stateRendererType;
  String massage;
  String title;
  Function retryActionFunction;

  StateRenderer(
      {super.key, required this.stateRendererType,
      this.massage = AppStrings.loading,
      this.title = "",
      required this.retryActionFunction});

  @override
  Widget build(BuildContext context) {
    return _getStateWidget(context);
  }

  Widget _getStateWidget(BuildContext context) {
    switch (stateRendererType) {
      case StateRendererType.popupLoadingState:
        return _getPopUpDialog(context, [
          _getAnimatedImage(JsonAssets.loading),
        ]);
      case StateRendererType.popupErrorState:
        return _getPopUpDialog(context, [
          _getAnimatedImage(JsonAssets.error),
          _getMassage(massage),
          _getRetryAgain(AppStrings.retryAgain, context),
        ]);
      case StateRendererType.fullScreenEmptyState:
        return _getItemsColumn([
          _getAnimatedImage(JsonAssets.empty),
          _getMassage(massage),
        ]);
      case StateRendererType.fullScreenErrorState:
        return _getItemsColumn([
          _getAnimatedImage(JsonAssets.error),
          _getMassage(massage),
          _getRetryAgain(AppStrings.retryAgain, context),
        ]);
      case StateRendererType.fullScreenLoadingState:
        return _getItemsColumn([
          _getAnimatedImage(JsonAssets.loading),
          _getMassage(massage),
        ]);
      case StateRendererType.contentState:
        return Container();
      default:
        return Container();
    }
  }

  Widget _getItemsColumn(List<Widget> children) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: children,
    );
  }

  Widget _getAnimatedImage(String animationName) {
    return SizedBox(
      height: AppSize.s100,
      width: AppSize.s100,
      child: Lottie.asset(animationName),
    );
  }

  Widget _getMassage(String massage) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(AppPadding.p8),
        child: Text(
          massage,
          style: getRegularStyle(
              color: ColorManager.black, fontSize: FontSize.s18),
        ),
      ),
    );
  }

  Widget _getRetryAgain(String buttonTitle, BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(AppPadding.p18),
      width: double.infinity,
      child: ElevatedButton(
          onPressed: () {
            if (stateRendererType == StateRendererType.fullScreenErrorState) {
              // call retry function
              retryActionFunction.call();
            } else {
              Navigator.of(context).pop();
            }
          },
          child: Text(
            buttonTitle,
          )),
    );
  }

  Widget _getPopUpDialog(BuildContext context, List<Widget> children) {
    return Dialog(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppSize.s14)),
      elevation: AppSize.s1_5,
      backgroundColor: Colors.transparent,
      child: Container(
        decoration: (BoxDecoration(
            color: ColorManager.white,
            shape: BoxShape.rectangle,
            borderRadius: BorderRadius.circular(AppSize.s14),
            boxShadow: const [
              BoxShadow(
                color: Colors.black26,
              )
            ])),
        child: _getDialogContent(context, [_getPopUpDialog(context, children)]),
      ),
    );
  }

  _getDialogContent(BuildContext context, List<Widget> children) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: children,
    );
  }
}

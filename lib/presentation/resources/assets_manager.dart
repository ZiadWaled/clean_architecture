
const String imagePath = "assets/images";
class ImageAssets{
  static const String splashLogo = "$imagePath/splash_logo.png";
  static const String onboardingLogo1 = "$imagePath/onboarding_logo1.svg";
  static const String onboardingLogo2 = "$imagePath/onboarding_logo2.svg";
  static const String onboardingLogo3 = "$imagePath/onboarding_logo3.svg";
  static const String onboardingLogo4 = "$imagePath/onboarding_logo4.svg";
  static const String solidCircleIc = "$imagePath/solid_circle_ic.svg";
  static const String rightArrowIc = "$imagePath/right_arrow_ic.svg";
  static const String leftArrowIc = "$imagePath/left_arrow_ic.svg";
  static const String hollowCirlceIc = "$imagePath/hollow_cirlce_ic.svg";
}// class OnBoardingPage extends StatelessWidget {
//   OnBoardingPage({super.key});
//   OnBoardingModel? onBoardingModel;
//
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       mainAxisAlignment: MainAxisAlignment.start,
//       children: [
//         const SizedBox(height: AppSize.s14),
//         Padding(
//           padding: const EdgeInsets.all(AppPadding.p8),
//           child: Text(
//             onBoardingModel!.title!,
//             style: Theme.of(context).textTheme.headlineLarge,
//             maxLines: AppConstants.onBoardingMaxLien,
//             overflow: TextOverflow.clip,
//           ),
//         ),
//         const SizedBox(height: AppSize.s4),
//         Padding(
//           padding: const EdgeInsets.all(AppPadding.p8),
//           child: Text(
//             onBoardingModel!.supTitle!,
//             style: Theme.of(context).textTheme.titleMedium,
//             maxLines: AppConstants.onBoardingMaxLien,
//             textAlign: TextAlign.center,
//             overflow: TextOverflow.clip,
//           ),
//         ),
//         const SizedBox(height: AppSize.s4),
//         SvgPicture.asset(onBoardingModel!.image!)
//       ],
//     );
//   }
// }
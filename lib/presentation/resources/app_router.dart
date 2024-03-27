import 'package:clean_architecture/app/di.dart';
import 'package:clean_architecture/presentation/forgot_password/forgot_password_view.dart';
import 'package:clean_architecture/presentation/login/view/login_view.dart';
import 'package:clean_architecture/presentation/onboarding/view/onboarding_view.dart';
import 'package:clean_architecture/presentation/register/view/register_view.dart';
import 'package:clean_architecture/presentation/splash/splash_view.dart';
import 'package:go_router/go_router.dart';

abstract class AppRouter {
  static const kLoginView = '/loginView';
  static const kRegisterView = '/registerView';
  static const kOnBoardingView = '/onBoardingView';
  static const kForgotPasswordView = '/forgotPasswordView';

  static final router = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => const SplashView(),
      ),
      GoRoute(
        path: kLoginView,
        builder: (context, state) {
          initLoginModule();
          return const LoginView();
        },
      ),
      GoRoute(
        path: kOnBoardingView,
        builder: (context, state) => const OnBoardingView(),
      ),
      GoRoute(
        path: kRegisterView,
        builder: (context, state)  {
          initRegisterModule();
          return const RegisterView();},
      ),
      GoRoute(
        path: kForgotPasswordView,
        builder: (context, state) => const ForgotPasswordView(),
      ),
    ],
  );
}

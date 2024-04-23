import 'package:clean_architecture/domain/usecase/register_usecase.dart';
import 'package:clean_architecture/presentation/common/freezed_data_classes.dart';
import 'package:clean_architecture/presentation/register/cubit/register_states.dart';
import 'package:clean_architecture/presentation/resources/app_router.dart';
import 'package:clean_architecture/presentation/resources/strings_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class RegesterCubit extends Cubit<RegesterStates> {
  RegesterCubit(this.registerUseCase) : super(AppInitialState());
  static RegesterCubit get(context) => BlocProvider.of(context);

  final formKey = GlobalKey<FormState>();
  final TextEditingController userNameEditingController =
      TextEditingController();
  final TextEditingController emailEditingController = TextEditingController();
  final TextEditingController passwordEditingController =
      TextEditingController();
  final TextEditingController phoneEditingController = TextEditingController();
  String userNameError = AppStrings.userNameError;
  String emailError = AppStrings.emailError;
  String passwordError = AppStrings.passwordError;
  String phoneError = AppStrings.phoneError;

  final RegisterUseCase registerUseCase;
  var registerObject = RegisterObject("", "", "", "");

  setPassword(String password) {
    registerObject =
        registerObject.copyWith(password: passwordEditingController.text);
  }

  setUserName(String userName) {
    registerObject = registerObject.copyWith(
        userName: userNameEditingController.text.trim());
  }

  setEmail(String email) {
    registerObject =
        registerObject.copyWith(email: emailEditingController.text.trim());
  }

  setPhone(String phone) {
    registerObject =
        registerObject.copyWith(phone: phoneEditingController.text.trim());
  }

  register(BuildContext context) async {
    // print("Register Object: $registerObject");
    final registerUseCaseInput = RegisterUseCaseInput(
        userNameEditingController.text.trim(),
        phoneEditingController.text.trim(),
        emailEditingController.text.trim(),
        passwordEditingController.text.trim());

    (await registerUseCase.execute(registerUseCaseInput)).fold(
      (failure) => print(failure.massage),
      (data) => print(data.phone),
    );
    if (formKey.currentState!.validate()) {
      GoRouter.of(context).push(AppRouter.kMainView);
    }
  }

  // validation Email

  String? validateEmail(String? value) {
    final emailPattern = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    if (value == null || value.isEmpty) {
      return AppStrings.emailError;
    }

    return null;
  }
  // validation PhoneNumber

  String? validatePhoneNumber(String? value) {
    if (value == null || value.isEmpty) {
      return AppStrings.phoneError;
    }
    return null;
  }
  // validation Password

  String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return AppStrings.passwordError;
    }
    return null;
  }

  // validation Username
  String? validateUsername(String? value) {
    if (value == null || value.isEmpty) {
      return AppStrings.userNameError;
    }
    return null;
  }
}

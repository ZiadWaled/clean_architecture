import 'package:clean_architecture/domain/repository/repository.dart';
import 'package:clean_architecture/domain/usecase/login_usecase.dart';
import 'package:clean_architecture/domain/usecase/register_usecase.dart';
import 'package:clean_architecture/presentation/common/freezed_data_classes.dart';
import 'package:clean_architecture/presentation/register/cubit/register_states.dart';
import 'package:clean_architecture/presentation/resources/strings_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
  bool _areInputsValid = false;


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

  register() async {
    final userName = userNameEditingController.text.trim();
    final email = emailEditingController.text.trim();
    final password = passwordEditingController.text.trim();
    final phone = phoneEditingController.text.trim();

    final registerObject = RegisterObject(userName, phone, email, password);

    (await registerUseCase.execute(RegisterUseCaseInput(
      registerObject.userName,
      registerObject.phone,
      registerObject.email,
      registerObject.password,
    )))
        .fold(
      (failure) => print(failure.massage),
      (data) => print(data.phone),
    );
  }

  String? validator(String? value, String? output) {
    if (value == null || value.isEmpty) {
      return output;
    }
    return null;
  }

  // bool _isPasswordValid(String password) {
  //   return password.isNotEmpty;
  // }
  //
  // bool _isUserNameValid(String userName) {
  //   return userName.isNotEmpty;
  // }
  //
  // bool _isEmailValid(String email) {
  //   return email.isNotEmpty;
  // }
  //
  // bool _isPhoneValid(String phone) {
  //   return phone.isNotEmpty;
  // }
  //
  // bool areAllInputsValid() {
  //
  //   return _isPasswordValid(registerObject.password) &&
  //       _isUserNameValid(registerObject.userName) &&
  //       _isPhoneValid(registerObject.phone) &&
  //       _isEmailValid(registerObject.email);
  // }

}

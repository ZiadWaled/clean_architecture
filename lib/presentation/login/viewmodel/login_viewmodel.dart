import 'dart:async';

import 'package:clean_architecture/presentation/base/base_view_model.dart';

class LoginViewModel
    implements BaseViewModel, LoginViewModelInput, LoginViewModelOutput {
  final StreamController _userNameStreamController =
      StreamController<String>.broadcast();
  final StreamController _passwordStreamController =
      StreamController<String>.broadcast();
  // inputs
  @override
  void dispose() {
    _userNameStreamController.close();
    _passwordStreamController.close();
  }

  @override
  void start() {
    // TODO: implement start
  }

  @override
  setPassword(String password) {
    // TODO: implement setPassword
    throw UnimplementedError();
  }

  @override
  setUserName(String userName) {
    // TODO: implement setUserName
    throw UnimplementedError();
  }

  @override
  login() {
    // TODO: implement login
    throw UnimplementedError();
  }

  @override
  Sink get inputPassword => _passwordStreamController.sink;

  @override
  Sink get inputUserName => _userNameStreamController;
  // outputs

  @override
  Stream<bool> get outputIsPassword => _passwordStreamController.stream
      .map((password) => isPasswordValid(password));

  bool isPasswordValid(String password) {
    return password.isNotEmpty;
  }

  @override
  Stream<bool> get outputIsUserNameValid => _userNameStreamController.stream
      .map((userName) => isUserNameValid(userName));
  bool isUserNameValid(String userName) {
    return userName.isNotEmpty;
  }
}

abstract class LoginViewModelInput {
  setUserName(String userName);
  setPassword(String password);
  login();
  Sink get inputUserName;
  Sink get inputPassword;
}

abstract class LoginViewModelOutput {
  Stream<bool> get outputIsUserNameValid;
  Stream<bool> get outputIsPassword;
}

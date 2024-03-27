import 'package:clean_architecture/data/network/failure.dart';
import 'package:clean_architecture/data/network/request.dart';
import 'package:clean_architecture/domain/model/models.dart';
import 'package:clean_architecture/domain/repository/repository.dart';
import 'package:clean_architecture/domain/usecase/base_usecase.dart';
import 'package:dartz/dartz.dart';

class RegisterUseCase implements BaseUseCase<RegisterUseCaseInput, SignUp> {
  final Repository _repository;

  RegisterUseCase(this._repository);

  @override
  Future<Either<Failure, SignUp>> execute(RegisterUseCaseInput input) async {
    return await _repository.signUp(
        RegisterRequest(input.name, input.phone, input.email, input.password));
  }
}

class RegisterUseCaseInput {
  String name;
  String phone;
  String email;
  String password;

  RegisterUseCaseInput(this.name, this.phone, this.email, this.password);
}

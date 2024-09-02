import 'package:clean_architecture/data/network/failure.dart';
import 'package:clean_architecture/data/network/request.dart';
import 'package:clean_architecture/domain/model/models.dart';
import 'package:dartz/dartz.dart';

abstract class Repository{
 Future<Either<Failure,Authentication>> login(LoginRequest loginRequest);
 Future<Either<Failure,SignUp>> signUp(RegisterRequest signUpRequest);
 Future<Either<Failure,HomeObject>> getHomeData();
}
import 'package:clean_architecture/data/data_source/remote_data_source.dart';
import 'package:clean_architecture/data/mapper/mapper.dart';
import 'package:clean_architecture/data/network/error_handler.dart';
import 'package:clean_architecture/data/network/failure.dart';
import 'package:clean_architecture/data/network/network_info.dart';
import 'package:clean_architecture/data/network/request.dart';
import 'package:clean_architecture/domain/model/models.dart';
import 'package:clean_architecture/domain/repository/repository.dart';
import 'package:dartz/dartz.dart';

class RepositoryImpl implements Repository {
  final RemoteDataSource _remoteDataSource;
  final NetworkInfo _networkInfo;

  RepositoryImpl(this._remoteDataSource, this._networkInfo);

  @override
  Future<Either<Failure, Authentication>> login(
      LoginRequest loginRequest) async {
    if (await _networkInfo.isConnected) {
      // internet not connection , call API
      try {
        final response = await _remoteDataSource.login(loginRequest);

        if (response.status == ApiInternalStatus.SUCCESS) {
          //success
          // Either right
          //return data

          return Right(response.toDomain());
        } else {
          // failure - business error
          // Either left
          return Left(
              Failure(ApiInternalStatus.FAILURE, ResponseMessage.DEFAULT));
        }
      } catch (error) {
        return Left(ErrorHandler.handle(error).failure);
      }
    } else {
      // internet not connection
      return Left(DataSource.NO_INTERNET_CONNECTION.getFailure());
    }
  }
}

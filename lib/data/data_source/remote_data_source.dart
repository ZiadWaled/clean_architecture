import 'package:clean_architecture/data/network/app_api.dart';
import 'package:clean_architecture/data/network/request.dart';
import 'package:clean_architecture/data/response/responses.dart';

abstract class RemoteDataSource {
  Future<AuthenticationResponse> login(LoginRequest loginRequest);
  Future<SignUpResponse> signUp(RegisterRequest signUpRequest);
}

class RemoteDataSourceImpl implements RemoteDataSource {
  final AppServiceClint _appServiceClient;

  RemoteDataSourceImpl(this._appServiceClient);
  @override
  Future<AuthenticationResponse> login(LoginRequest loginRequest) async {
    return await _appServiceClient.login(
      loginRequest.email,
      loginRequest.password,
    );
  }

  @override
  Future<SignUpResponse> signUp(RegisterRequest signUpRequest) async {
    return await _appServiceClient.signUp(
      signUpRequest.name,
      signUpRequest.phone,
      signUpRequest.email,
      signUpRequest.password,
    );
  }
}

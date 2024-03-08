import
'package:clean_architecture/data/network/app_api.dart';
import 'package:clean_architecture/data/network/request.dart';
import 'package:clean_architecture/data/response/responses.dart';

abstract class RemoteDataSource {
  Future<AuthenticationResponse> login(LoginRequest loginRequest);
}

class RemoteDataSourceImpl implements RemoteDataSource {
  final AppServiceClint _appServiceClint;

  RemoteDataSourceImpl(this._appServiceClint);
  @override
  Future<AuthenticationResponse> login(LoginRequest loginRequest) async {
    return await _appServiceClint.login(
      loginRequest.email,
      loginRequest.password,
    );
  }
}

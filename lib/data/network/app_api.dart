import 'package:clean_architecture/app/constants.dart';
import 'package:clean_architecture/data/response/responses.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';
part 'app_api.g.dart';

@RestApi(baseUrl: Constants.baseUrl)
abstract class AppServiceClint {
  factory AppServiceClint(Dio dio, {String? baseUrl}) = _AppServiceClint;
  @POST("/customers/login")
  Future<AuthenticationResponse> login(
    @Field("email") String email,
    @Field("password") String password,
  );
}

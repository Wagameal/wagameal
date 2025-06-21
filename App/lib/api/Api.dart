
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import '../modules/login/wrappers/RequestLogin.dart';
import '../modules/login/wrappers/ResponseLogin.dart';

part 'Api.g.dart';

@RestApi(baseUrl: "")
abstract class Api {
  factory Api(Dio dio, {String baseUrl}) = _Api;

  @POST("/api/auth/login")
  Future<ResponseLogin> userLogin(@Body() RequestLogin request);

  @POST("/api/auth/verify")
  Future<ResponseLogin> userLoginVerify(@Body() RequestLogin request);

}

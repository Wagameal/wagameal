
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import '../modules/login/wrappers/RequestLogin.dart';
import '../modules/login/wrappers/ResponseLogin.dart';

part 'Api.g.dart';

@RestApi(baseUrl: "")
abstract class Api {
  factory Api(Dio dio, {String baseUrl}) = _Api;

  @POST("/api/auth/login")
  Future<ResponseLogin> sentOtp(@Body() RequestLogin request);

  @POST("/api/auth/resend-otp")
  Future<ResponseLogin> resendOtp(@Body() RequestLogin request);

  @POST("/api/auth/verify")
  Future<ResponseLogin> userLoginVerify(@Body() RequestLogin request);

  @GET("/api/meal")
  Future<ResponseLogin> getMeal(@Header('authorization') String token);

  @GET("/api/meal")
  Future<ResponseLogin> getBannerList(@Header('authorization') String token);



}

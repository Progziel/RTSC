import 'package:boxing/models/profile/update_profile_model.dart';
import 'package:dio/dio.dart';

import 'package:retrofit/http.dart';

import '../models/auth_models/login_body_model.dart';
import '../models/auth_models/login_model.dart';
import '../models/auth_models/logout_body_model.dart';
import '../models/auth_models/logout_model.dart';
import '../models/auth_models/signup_body_model.dart';
import '../models/auth_models/signup_model.dart';
import '../models/dashboard_models/live_matches_body_model.dart';
import '../models/dashboard_models/search_filter_body_model.dart';
import '../models/dashboard_models/search_filter_model.dart';
import '../models/profile/get_profile_model.dart';
import '../models/profile/update_profile_body_model.dart';
import 'api_constant.dart';

part 'auth_api.g.dart';

@RestApi(baseUrl: ApiConstants.baseUrl)
abstract class AuthApi {
  factory AuthApi(Dio dio, {String baseUrl}) = _AuthApi;

  @POST('/signup')
  Future<SignupBodyModel> signupUser(@Body() SignupModel signupModel);

  // @POST('/users/verify-otp')
  // Future<VerifyOtpBodyModel> verifyOtp(@Body() VerifyOtpModel verifyOtpModel);

  @POST('/login')
  Future<LoginBodyModel> loginUser(@Body() LoginModel loginModel);

  @POST('/signout')
  Future<LogoutBodyModel> logoutUser();

  /// Dashboard
  @GET('/livematchesview')
  Future<LiveMatchesBodyModel> liveMatches();

  /// Profile
@GET('/profile_view')
  Future<GetProfileBodyModel> getProfile();

@POST('/profile_edit')
  Future<UpdateProfileBodyModel> updateProfile(@Body() UpdateProfileModel updateProfileModel);

@POST('/livematchessearch')
  Future<SearchFilerBodyModel> searchFilter (@Body() SearchFilterModel searchFilterModel);

// @POST('/users/resend-otp')
  // Future<dynamic> resendOtp(@Body() ResendOtpModel resendOtpModel);

  // @POST("/customer/sign-up")
  // Future<SignupBodyModel> signUpUser(@Body() SignUpModel requestBody);
  //
  // @POST("/customer/verify-otp")
  // Future<VerifyOTPBodyModel> verifyOTP(@Body() VerifyOTPModel signUpOTP);
  //
  // @POST("/customer/resend-otp")
  // Future<ResendOTPBodyModel> resendOTP (@Body() ResendOTPModel resendOTPModel);
}

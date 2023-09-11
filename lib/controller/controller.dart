
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

import '../api/api_constant.dart';
import '../api/auth_api.dart';
import '../api/dio.dart';
import '../models/auth_models/login_body_model.dart';
import '../models/auth_models/login_model.dart';
import '../models/auth_models/signup_body_model.dart';
import '../models/auth_models/signup_model.dart';


class UserController extends GetxController {
  final signupApi = AuthApi(dio, baseUrl: ApiConstants.baseUrl);


  Future<SignupBodyModel> userSignup(SignupModel signupModel) async {
    final value = await signupApi.signupUser(signupModel);
    return value;
  }

  // Future<VerifyOtpBodyModel> verifyOtp(VerifyOtpModel verifyOtpModel)async{
  //   final value = await signupApi.verifyOtp(verifyOtpModel);
  //   return value;
  // }

  Future<LoginBodyModel> loginUser(LoginModel loginModel)async{
    final value = await signupApi.loginUser(loginModel);
    return value;
  }

  // Future<dynamic> resendOtp(ResendOtpModel resendOtpModel)async{
  //   final value = await signupApi.resendOtp(resendOtpModel);
  //   return value;
  // }
  // Future<VerifyOTPBodyModel> signupVerificationOTP(
  //     VerifyOTPModel signUpOTP) async {
  //   final signupApi = SignupApi(dio, baseUrl: ApiConstants.baseUrl);
  //   final value = await signupApi.verifyOTP(signUpOTP);
  //   return value;
  // }
  //
  // Future<ResendOTPBodyModel> resendOTP(ResendOTPModel resendOTPModel) async {
  //   final signupApi = SignupApi(dio, baseUrl: ApiConstants.baseUrl);
  //
  //   final value = await signupApi.resendOTP(resendOTPModel);
  //   return value;
  // }
  //
  // Future<LoginBodyModel> userLogIn(LoginModel loginModel) async {
  //   String? deviceToken = await locator<FirebaseMessagingService>().getToken();
  //   String? deviceName = await locator<DeviceInfoService>().getDeviceName();
  //   String? deviceModel = await locator<DeviceInfoService>().getDeviceModel();
  //   loginModel.device_token = deviceToken;
  //   loginModel.device_name = deviceName;
  //   loginModel.device_model = deviceModel;
  //   final loginApi = LoginApi(dio, baseUrl: ApiConstants.baseUrl);
  //   final value = await loginApi.loginUser(loginModel);
  //   return value;
  // }
  //
  // Future<ForgetPassBodyModel> forgetPass(
  //     ForgetPassModel forgetPassModel) async {
  //   final loginApi = LoginApi(dio, baseUrl: ApiConstants.baseUrl);
  //
  //   final value = await loginApi.forgetPassword(forgetPassModel);
  //   return value;
  // }
  //
  // Future<ResetPassBodyModel> resetPass(ResetPassModel resetPassModel) async {
  //   final loginApi = LoginApi(dio, baseUrl: ApiConstants.baseUrl);
  //
  //   final value = await loginApi.resetPassword(resetPassModel);
  //   return value;
  // }
  //
  // //get profile is use to show the user info in profile screen
  //
  // Future<GetProfileModel> getProfile(String id) async {
  //   final customerApi =
  //   CustomerApi(dioInterceptor, baseUrl: ApiConstants.baseUrl);
  //   final value = await customerApi.getProfile(id);
  //   return value;
  // }
  //
  // //update the given information of the user in edit profile screen
  //
  // Future<UpdateCustomerProfileBodyModel> updateProfile(
  //     UpdateCustomerProfileModel updateCustomerProfileModel) async {
  //   final customerApi =
  //   CustomerApi(dioInterceptor, baseUrl: ApiConstants.baseUrl);
  //   final value = await customerApi.updateProfile(updateCustomerProfileModel);
  //   return value;
  // }
  //
  // //set the profile image of the user
  //
  // Future<SetProfileImageBodyModel> setProfileImage(
  //     String setProfileImage, file) async {
  //   final customerApi =
  //   CustomerApi(dioInterceptor, baseUrl: ApiConstants.baseUrl);
  //   final value = await customerApi.setProfileImage(setProfileImage, file);
  //   return value;
  // }
  //
  // Future<LogoutBodyModel> logoutUser(LogoutModel logoutModel) async {
  //   final loginApi = LoginApi(dio, baseUrl: ApiConstants.baseUrl);
  //
  //   final value = await loginApi.logoutUser(logoutModel);
  //   return value;
  // }
  //
  // //Employee Part
  // Future<CheckEmployeeModel> checkEmp(String dynamics_emp_id) async {
  //   final employeeApi = EmployeeApi(dio, baseUrl: ApiConstants.baseUrl);
  //   final value = await employeeApi.checkEmployee(dynamics_emp_id);
  //   return value;
  // }
  //
  // Future<SetupEmpAccBodyModel> setupEmpAcc(
  //     SetupEmpAccModel setupEmpAccModel) async {
  //   final employeeApi = EmployeeApi(dio, baseUrl: ApiConstants.baseUrl);
  //   final value = await employeeApi.setupEmpAcc(setupEmpAccModel);
  //   return value;
  // }
}
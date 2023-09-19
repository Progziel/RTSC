
import 'dart:collection';

import 'package:boxing/models/dashboard_models/fighter_detail_body_model.dart';
import 'package:boxing/models/dashboard_models/fighter_detail_model.dart';
import 'package:boxing/models/dashboard_models/get_notification_body_model.dart';
import 'package:boxing/models/dashboard_models/search_filter_body_model.dart';
import 'package:boxing/models/dashboard_models/search_filter_model.dart';
import 'package:boxing/models/profile/update_profile_model.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:image_picker/image_picker.dart';

import '../api/api_constant.dart';
import '../api/auth_api.dart';
import '../api/dashboard_api.dart';
import '../api/dio.dart';
import '../models/auth_models/login_body_model.dart';
import '../models/auth_models/login_model.dart';
import '../models/auth_models/logout_body_model.dart';
import '../models/auth_models/logout_model.dart';
import '../models/auth_models/signup_body_model.dart';
import '../models/auth_models/signup_model.dart';
import '../models/dashboard_models/all_matches_body_model.dart';
import '../models/dashboard_models/latest_news_body_model.dart';
import '../models/dashboard_models/live_matches_body_model.dart';
import '../models/dashboard_models/ticker_live_update_body_model.dart';
import '../models/profile/get_profile_model.dart';
import '../models/profile/set_profile_image_body_model.dart';
import '../models/profile/update_profile_body_model.dart';


class UserController extends GetxController {
  RxBool loading = false.obs;
  RxBool showCategories = true.obs;
  Rx<XFile?> image = Rx<XFile?>(null);

  ///---wishlist
  RxBool selectedMatch = false.obs;


  final _items = <AllMatchesModel>[].obs;
  List<AllMatchesModel> get items => _items;

  void addToWishList(AllMatchesModel allMatch) {
    _items.add(allMatch);
  }

  void removeFromWishList(AllMatchesModel product) {
    _items.remove(product);
  }

  bool isFavorite(AllMatchesModel match) {
    return _items.contains(match);
  }
  ///----


  final authApi = AuthApi(dio, baseUrl: ApiConstants.baseUrl);
  //final dashboardApi = DashboardApi(dio, baseUrl: ApiConstants.baseUrl);


  Future<SignupBodyModel> userSignup(SignupModel signupModel) async {
    final value = await authApi.signupUser(signupModel);
    return value;
  }


  Future<LoginBodyModel> loginUser(LoginModel loginModel)async{
    final value = await authApi.loginUser(loginModel);
    return value;
  }


  Future<LogoutBodyModel> logoutUser() async {
    final value = await authApi.logoutUser();
    return value;
  }

  ///Dashboard
  Future<LiveMatchesBodyModel> liveMatchesData()async {
    final value = await authApi.liveMatches();
    return value;
  }

  Future<AllMatchesBodyModel> allMatches() async {
    final value = await authApi.allMatches();
    return value;
  }

  ///profile
  Future<GetProfileBodyModel> getProfile()async{
    final value = await authApi.getProfile();
    return value;
  }

  Future<UpdateProfileBodyModel> updateProfile(UpdateProfileModel updateProfileModel)async{
    final res = await authApi.updateProfile(updateProfileModel);
    return res;
  }

  Future<SetProfileImageBodyModel> setProfileImage(image) async {
   final value = await authApi.setProfileImage(image);
    return value;
  }



  Future<SearchFilerBodyModel> search (SearchFilterModel searchFilterModel)async{
    final res = await authApi.searchFilter(searchFilterModel);
    return res;
  }

  Future<LatestNewsBodyModel> getLatestNews ()async{
    final res = await authApi.getLatestNews();
    return res;
  }

  Future<FighterDetailBodyModel> fighterDetail(FighterDetailModel fighterDetailModel)async{
    final res = await authApi.fighterDetail(fighterDetailModel);
    return res;
  }

  ///---Notification
  Future<GetNotificationBodyModel> getNotification()async{
    final value = await authApi.getNotification();
    return value;
  }

  ///ticker
  Future<LiveUpdateBodyModel> liveUpdate()async{
    final value = await authApi.liveUpdate();
    return value;
  }

}
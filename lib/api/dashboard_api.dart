import 'package:dio/dio.dart';

import 'package:retrofit/http.dart';

import '../models/dashboard_models/live_matches_body_model.dart';
import 'api_constant.dart';

part 'dashboard_api.g.dart';

@RestApi(baseUrl: ApiConstants.baseUrl)
abstract class DashboardApi {
  factory DashboardApi(Dio dio, {String baseUrl}) = _DashboardApi;

  // @GET('/livematchesview')
  // Future<LiveMatchesBodyModel> liveMatches();


}

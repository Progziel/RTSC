
import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

final dio = Dio()
  ..interceptors.add(
    PrettyDioLogger(
      compact: true,
      request: true,
      requestBody: true,
      requestHeader: false,
      responseBody: true,
      responseHeader: false,
      error: true,
    ),


  );
// final dioInterceptor=Dio()
//   ..interceptors.add(
//     InterceptorsWrapper(
//       onRequest: (options, handler)async {
//         SharedPreferences prefs =await SharedPreferences.getInstance();
//         String token = prefs.getString("token")!;
//         log('TOken: $token');
//         options.headers.addAll({
//           'Authorization': 'Bearer $token',
//         });
//         handler.next(options);
//       },
//     ),
//   )
//   ..interceptors.add(
//     PrettyDioLogger(
//       compact: true,
//       request: true,
//       requestBody: true,
//       requestHeader: false,
//       responseBody: true,
//       responseHeader: false,
//       error: true,
//     ),
//
//
//   );

import 'package:dio/dio.dart';
import '../rest_constants.dart';

class ApiClient {
  static final ApiClient _converter = ApiClient._internal();

  static const String REQUIRES_HEADER = "header";
  static const String REQUEST_TOKEN = "token";

  factory ApiClient() {
    return _converter;
  }

  ApiClient._internal();

  Dio dio() {
    var dio = Dio(
      BaseOptions(
          connectTimeout: 5000,
          receiveTimeout: 5000,
          baseUrl: RestConstants.BASE_URL),
    );

    dio.interceptors.addAll(
      [
        LogInterceptor(
          error: true,
          requestBody: true,
        ),
        InterceptorsWrapper(
          onRequest: (RequestOptions options) async {
            if (options.headers[REQUIRES_HEADER]) {
              // add your fix headers
            }
            //remove the auxiliary header
            options.headers.remove(REQUIRES_HEADER);
            return options;
          },
        ),
      ],
    );

    return dio;
  }
}

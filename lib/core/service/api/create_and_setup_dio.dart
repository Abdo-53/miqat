import 'package:dio/dio.dart';

class CreateAndSetupDio {
  Dio createAndSetupDio() {
    Dio dio = Dio();

    dio
      ..options.connectTimeout = Duration(seconds: 2)
      ..options.receiveTimeout = Duration(seconds: 2);

    dio.options = BaseOptions(
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
      },
      validateStatus: (status) {
        return status != null && status < 500;
      },
      connectTimeout: const Duration(seconds: 20),
      receiveTimeout: const Duration(seconds: 20),
    );

    dio.interceptors.add(
      LogInterceptor(
        responseBody: true,
        error: true,
        requestHeader: false,
        responseHeader: false,
        request: true,
        requestBody: true,
      ),
    );
    return dio;
  }
}

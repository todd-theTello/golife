import 'package:dio/dio.dart';

import 'endpoints.dart';
import 'interceptors/interceptors.dart';

/// dio weather client
class DioClient {
  /// weather client constructor
  const DioClient();

  /// connection timeout duration
  static const Duration connectionTimeout = Duration(milliseconds: 150000);

  /// receive timeout duration
  static const Duration receiveTimeout = Duration(milliseconds: 150000);

  /// static dio instance
  static final Dio dio = Dio(
    BaseOptions(
      baseUrl: Endpoints.baseUrl,
      connectTimeout: connectionTimeout,
      receiveTimeout: receiveTimeout,
    ),
  )..interceptors.addAll([
      NetworkInterceptor(),
      LoggerInterceptor(),
    ]);

  /// function to make the network request
  Future<Response<dynamic>> call({
    required String path,
    required RequestMethod requestMethod,
    Map<String, dynamic>? data,
    List<Map<String, dynamic>>? listData,
    Map<String, dynamic>? queryParams,
  }) async {
    try {
      /// perform the required network request based on the method requested
      return switch (requestMethod) {
        RequestMethod.get => await dio.get(path, queryParameters: queryParams),
        RequestMethod.post => await dio.post(path, data: listData ?? data, queryParameters: queryParams),
        RequestMethod.put => await dio.put(path, data: listData ?? data, queryParameters: queryParams),
        RequestMethod.patch => await dio.patch(path, data: listData ?? data, queryParameters: queryParams),
        RequestMethod.delete => await dio.delete(path, data: listData ?? data, queryParameters: queryParams),
      };
    } on DioException catch (error, stackTrace) {
      return Future.error(error, stackTrace);
    }
  }
}

///
enum RequestMethod {
  ///
  get,

  ///
  post,

  ///
  put,

  ///
  patch,

  ///
  delete,
}

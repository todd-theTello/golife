import 'dart:async';

import 'package:dio/dio.dart';

import '../../database/secure_storage.dart';
import '../jwt_decoder.dart';

/// Authorization interceptor
class NetworkInterceptor extends QueuedInterceptorsWrapper {
  /// Interceptor on network response
  @override
  Future<FutureOr<dynamic>> onResponse(Response<dynamic> response, ResponseInterceptorHandler handler) async {
    if (response.statusCode! >= 200 && response.statusCode! < 400) {
      response.statusCode = 200;
    }
    super.onResponse(response, handler);
  }

  /// Authorization interceptor on network request
  @override
  Future<void> onRequest(RequestOptions options, RequestInterceptorHandler handler) async {
    /// fetch the access token from secure storage
    final String? bearerToken = await SecureStorage.readFromStorage(key: 'access_token');
    final String? refreshToken = await SecureStorage.readFromStorage(key: 'refresh_token');

    /// check if access token is expired
    if (JwtDecoder.isExpired(bearerToken ?? '')) {
      /// refresh the access token if the token is expired
      // final String? newToken = await RefreshTokenRepository.refreshToken();
      // options.headers.addAll({
      //   'Authorization': '$newToken',
      //   'Content-Type': 'application/json',
      // });
    } else {
      options.headers.addAll({
        'Authorization': '$bearerToken',
        'Content-Type': 'application/json',
      });
    }
    super.onRequest(options, handler);
  }
}

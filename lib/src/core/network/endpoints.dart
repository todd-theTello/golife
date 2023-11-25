/// entity containing static strings
class Endpoints {
  /// connection timeout duration
  static const Duration connectionTimeout = Duration(milliseconds: 150000);

  /// receive timeout duration
  static const Duration receiveTimeout = Duration(milliseconds: 150000);

  /// pam tech api base url
  static const String baseUrl = 'https://api-v2.nnuro.com:8000/';

  /// login api endpoint
  static const String login = 'api/v1/core/auth/login';

  /// login api endpoint
  static const String refreshToken = 'api/v1/core/auth/refresh-token';
}

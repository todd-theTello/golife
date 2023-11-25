/// Authentication response entity
class AuthenticationResponse {
  /// creates an instance of authentication response
  AuthenticationResponse({required this.accessToken, required this.refreshToken});

  /// converts authentication response form json to an authentication response instance
  factory AuthenticationResponse.fromJson(dynamic json) => AuthenticationResponse(
        accessToken: json['access_token'].toString(),
        refreshToken: json['refresh_token'].toString(),
      );

  /// Access token
  final String? refreshToken;

  /// User data
  final String? accessToken;
}

/// Login request data
class LoginRequestData {
  /// Login request data constructor
  const LoginRequestData({required String email, required String password})
      : _email = email,
        _password = password;

  final String _email;
  final String _password;

  ///
  Map<String, dynamic> toJson() => {
        'email': _email,
        'password': _password,
      };
}

/// Registration request data
class RegistrationRequestData extends LoginRequestData {
  /// Registration request data constructor
  const RegistrationRequestData({
    required super.email,
    required super.password,
    required String surname,
    required String otherNames,
  })  : _surname = surname,
        _otherNames = otherNames;

  ///
  final String _surname;

  ///
  final String _otherNames;

  ///
  @override
  Map<String, dynamic> toJson() => {
        'email': _email,
        'password': _password,
        'surname': _surname,
        'other_names': _otherNames,
      };
}

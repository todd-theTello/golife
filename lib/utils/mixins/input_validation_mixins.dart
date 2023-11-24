/// mixin to check input validators
mixin InputValidationMixin {
  ///
  final emailInputPattern = '[a-z0-9@-_.]';

  ///
  static const emailValidationPattern = r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$';

  /// checks if provided password is valid

  bool isPasswordValid({required String password}) => password.length >= 8;

  ///
  final passwordPattern = r'[a-z0-9A-Z@$!%*?&^#;_+-]';

  ///
  bool validPassword({required String passwordText}) {
    final regex = RegExp(r'^[a-z0-9A-Z@$!%*?&^#;_+-]{8,}$');
    return regex.hasMatch(passwordText);
  }

  /// Checks if provided email is valid
  bool isEmailValid({required String email}) {
    /// define regular expression
    final regex = RegExp(emailValidationPattern);
    return regex.hasMatch(email);
  }

  /// Check if provided phone number is valid
  bool isPhoneNumberValid({required String phoneNumber}) {
    /// define regEx pattern
    const pattern = r'^\d{9,}$';

    /// define regular expression
    final regex = RegExp(pattern);
    return regex.hasMatch(phoneNumber);
  }
}

///
class InputValidationClass {
  ///
  static const emailInputPattern = '[a-z0-9@-_.]';

  ///
  static const emailValidationPattern = r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$';

  ///
  static const passwordPattern = r'[a-z0-9A-Z@$!%*?&^#;_+-]';

  ///
  static bool validPassword({required String passwordText}) {
    final regex = RegExp(r'^[a-z0-9A-Z@$!%*?&^#;_+-]{8,}$');
    return regex.hasMatch(passwordText);
  }

  /// checks if provided password is valid

  /// Checks if provided email is valid
  static bool isEmailValid({required String email}) {
    /// define regular expression
    final regex = RegExp(emailValidationPattern);
    return regex.hasMatch(email);
  }

  /// Check if provided phone number is valid
  static bool isPhoneNumberValid({required String phoneNumber}) {
    /// define regEx pattern
    const pattern = r'^\d{9,}$';

    /// define regular expression
    final regex = RegExp(pattern);
    return regex.hasMatch(phoneNumber);
  }
}

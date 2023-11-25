part of 'authorization_states_notifier.dart';

@immutable

/// abstraction of authorization states
abstract class AuthorizationStates {}

/// state when user is authorized to use the app after successful login
class Authorized extends AuthorizationStates {}

/// state when user is not authorized but has passed onboarding stage
class Unauthorized extends AuthorizationStates {
  /// constructor
  Unauthorized({bool? isLoginPage}) : isLoginPage = isLoginPage ?? true;

  /// sets whether to navigate to the login page or the registration
  final bool isLoginPage;
}

/// state when user hasn't passed the landing page
class Onboarding extends AuthorizationStates {}

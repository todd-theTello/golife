part of 'authorization_states_notifier.dart';

@immutable

/// abstraction of authorization states
abstract class AuthorizationStates {}

/// state when user is authorized to use the app after successful login
class Authorized extends AuthorizationStates {}

/// state when user is not authorized but has passed onboarding stage
class Unauthorized extends AuthorizationStates {}

/// state when user is not authorized but has passed onboarding stage
class UnauthorizedRegister extends AuthorizationStates {}

/// state when user hasn't passed the landing page
class Onboarding extends AuthorizationStates {}

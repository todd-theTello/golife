import 'package:flutter/foundation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../utils/extensions/log.dart';
import '../../database/shared_preference.dart';

part 'authorization_states.dart';

/// state notifier provider to access the authorization state notifier
final authorizationStateProvider = StateNotifierProvider<AuthorizationStateNotifier, AuthorizationStates>((ref) {
  return AuthorizationStateNotifier();
});

/// Authorization state notifier for authorization states
/// Authorization states are the state of the user in relation to authentication
/// When a user is authenticated successfully, [Authorized] is passed.
/// When a user is unauthenticated or logged out, [Unauthorized] is passed.
/// When a user is unauthenticated and hasn't passed onboarding, [Onboarding] is passed.
class AuthorizationStateNotifier extends StateNotifier<AuthorizationStates> {
  /// Constructor
  AuthorizationStateNotifier() : super(Onboarding()) {
    if (LocalPreference.isLoggedIn) {
      state = Authorized();
    } else if (LocalPreference.hasOnboarded) {
      state = Unauthorized();
    } else {
      state = Onboarding();
    }
  }

  /// check the onboarding state depending on the value from local db
  void checkOnboarding({bool? isLoginPage}) {
    if (LocalPreference.isLoggedIn) {
      state = Authorized();
    } else if (LocalPreference.hasOnboarded) {
      state = Unauthorized(isLoginPage: isLoginPage);
    } else {
      state = Onboarding();
    }
  }

  /// set the the value on onboarded to true
  Future<void> setOnboarded({bool? isLoginPage}) async {
    await LocalPreference.writeBoolToStorage(key: LocalPreference.KEY_ON_BOARDED, value: true);
    checkOnboarding();
  }

  /// set the the value on onboarded to true
  Future<void> setLoggedIn() async {
    await LocalPreference.writeBoolToStorage(key: LocalPreference.KEY_IS_LOGIN, value: true);
    checkOnboarding();
    LocalPreference.isLoggedIn.log();
  }

  /// set the the value on onboarded to true
  Future<void> setLogOut() async {
    await LocalPreference.writeBoolToStorage(key: LocalPreference.KEY_IS_LOGIN, value: false);
    checkOnboarding();
    LocalPreference.isLoggedIn.log();
  }
}

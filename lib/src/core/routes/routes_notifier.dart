import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../states/authorization/authorization_states_notifier.dart';

/// change notifier provider to listen to route notifier
final routeNotifierProvider = ChangeNotifierProvider<RouteNotifier>((ref) {
  return RouteNotifier(ref);
});

/// Route Notifier extends a change notifier which also extends a listenable
class RouteNotifier extends ChangeNotifier {
  ///
  RouteNotifier(this._ref) {
    /// listens for state changes in [AuthorizationStateNotifier]
    _ref.listen(authorizationStateProvider, (_, __) => notifyListeners());
  }
  final Ref _ref;

  /// handles the redirect login in go router
  String? redirectLogic(BuildContext context, GoRouterState state) {
    final routeState = _ref.watch(authorizationStateProvider);
    final path = state.uri.path;
    if (routeState is Authorized) {
      print(path);
      if (path.startsWith('/sign-in') || path.startsWith('/sign-up') || path.startsWith('/welcome')) {
        return '/main';
      }
    }
    if (routeState is Unauthorized) {
      if (!path.startsWith('/sign-in')) {
        return '/sign-in';
      }
    }
    if (routeState is UnauthorizedRegister) {
      if (!path.startsWith('/sign-up')) {
        return '/sign-up';
      }
    }
    if (routeState is Onboarding) {
      return '/welcome';
    }
    return null;
  }
}

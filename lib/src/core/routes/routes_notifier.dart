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
    _ref.listen(authorizationStateProvider, (_, __) => notifyListeners());
  }
  final Ref _ref;

  ///
  String? redirectLogic(BuildContext context, GoRouterState state) {
    final routeState = _ref.watch(authorizationStateProvider);

    if (routeState is Authorized) {
      return '/main';
    } else if (routeState is Unauthorized) {
      if (routeState.isLoginPage) {
        return '/login';
      }
      return '/registration';
    } else {
      return '/';
    }
  }
}

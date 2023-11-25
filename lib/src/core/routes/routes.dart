import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../ui/ui/authentication/authentication.dart';
import '../../ui/ui/welcome/welcome.dart';
import 'routes_notifier.dart';

/// create a provider to access the go router configuration
final goRouterProvider = Provider<GoRouter>(
  (ref) {
    final router = RouteNotifier(ref);

    return GoRouter(
      initialLocation: '/',
      refreshListenable: router,
      redirect: router.redirectLogic,
      routes: [
        GoRoute(
          path: '/',
          builder: (context, state) => const WelcomeView(),
        ),
        GoRoute(
          path: '/login',
          builder: (context, state) => const SignInView(),
        ),
      ],
    );
  },
);

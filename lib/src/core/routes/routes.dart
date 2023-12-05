import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../ui/views/authentication/authentication.dart';
import '../../ui/views/insurance/insurance.dart';
import '../../ui/views/investments/user_investment_details.dart';
import '../../ui/views/navigation_wrapper/main_navigation_wrapper.dart';
import '../../ui/views/profile/profile.dart';
import '../../ui/views/profile/theme.dart';
import '../../ui/views/welcome/welcome.dart';
import 'routes_notifier.dart';

/// create a provider to access the go router configuration
final goRouterProvider = Provider<GoRouter>(
  (ref) {
    final router = RouteNotifier(ref);

    return GoRouter(
      initialLocation: '/welcome',
      refreshListenable: router,
      redirect: router.redirectLogic,
      routes: [
        GoRoute(
          path: '/welcome',
          name: 'welcome',
          builder: (context, state) => const WelcomeView(),
        ),
        GoRoute(
          path: '/sign-in',
          name: 'sign-in',
          builder: (context, state) => SignInView(),
          routes: [
            GoRoute(
              path: 'forgot-password',
              name: 'forgot-password',
              builder: (context, state) => ForgotPasswordView(),
            ),
          ],
        ),
        GoRoute(
          path: '/sign-up',
          name: 'sign-up',
          builder: (context, state) => SignUpView(),
          routes: [
            GoRoute(
              path: 'verify-otp',
              name: 'verify-otp',
              builder: (context, state) => const VerifyOtpView(),
            ),
          ],
        ),
        GoRoute(
          path: '/main',
          name: 'main',
          builder: (context, state) => const MainNavigationWrapper(),
          routes: [
            GoRoute(
                path: 'user-insurance-policies',
                name: 'user-insurance-policies',
                builder: (context, state) => const MainNavigationWrapper(),
                routes: [
                  GoRoute(
                    path: 'user-insurance-policy-details',
                    name: 'user-insurance-policy-details',
                    builder: (context, state) => const UserPolicyDetailView(),
                  ),
                ]),
            GoRoute(
              path: 'user-insurance-policy-details',
              name: 'user-insurance-policy-details-from-main',
              builder: (context, state) => const UserPolicyDetailView(),
            ),
            GoRoute(
              path: 'user-investment-details',
              name: 'user-investment-from-main',
              builder: (context, state) => const UserInvestmentDetailsView(),
            ),
            GoRoute(
              path: 'insurance-policies',
              name: 'insurance-policies',
              builder: (context, state) => const MainNavigationWrapper(),
            ),
            GoRoute(path: 'profile', name: 'profile', builder: (context, state) => const ProfileView(), routes: [
              GoRoute(
                path: 'theme-settings',
                name: 'theme-settings',
                builder: (context, state) => const ThemeSettingsView(),
              ),
            ]),
          ],
        ),
      ],
    );
  },
);

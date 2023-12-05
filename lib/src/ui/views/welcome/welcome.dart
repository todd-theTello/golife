import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../../utils/extensions/widget.dart';
import '../../../core/states/authorization/authorization_states_notifier.dart';
import '../../themes/themes.dart';
import '../../widgets/buttons/buttons.dart';
import '../../widgets/rich_text/rich_text.dart';
import 'elements/welcome_elements.dart';

/// Creates the welcome view, this is the first screen a new user sees after the splash screen loads
class WelcomeView extends ConsumerStatefulWidget {
  /// constructor
  const WelcomeView({super.key});

  @override
  ConsumerState createState() => _WelcomeViewState();
}

class _WelcomeViewState extends ConsumerState<WelcomeView> {
  int currentPage = 1;
  final PageController pageController = PageController();

  final pages = <Widget>[
    const PageOneElement(),
    const PageTwoElement(),
    const PageThreeElement(),
  ];
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            bottom: 120,
            child: PageView.builder(
              physics: const BouncingScrollPhysics(),
              controller: pageController,
              itemCount: pages.length,
              itemBuilder: (context, index) => pages[index],
            ),
          ),
          Positioned(
            top: 40,
            right: 24,
            child: CustomAnimatedScale(
              onPressed: () {},
              child: Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.transparent,
                  borderRadius: BorderRadius.circular(6),
                  border: Border.all(color: Colors.white),
                ),
                child: Text(
                  'Skip',
                  style: kBody1(
                    height: 1,
                    color: Colors.white,
                  ),
                ),
              ).paddingSymmetric(vertical: 32).centerRightAlign(),
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              padding: const EdgeInsets.fromLTRB(24, 24, 24, 32),
              decoration: BoxDecoration(
                color: theme.scaffoldBackgroundColor,
                borderRadius: BorderRadius.vertical(
                  top: Radius.circular(16),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  FilledButton(
                    onPressed: () async {
                      await ref.read(authorizationStateProvider.notifier).setOnboarded(isLoginPage: false);
                    },
                    child: const Text("Let's Get Started"),
                  ).paddingOnly(bottom: 24),
                  RichTextWidget(
                    texts: [
                      const BaseText(text: 'Already have an account? '),
                      BaseText.custom(
                        text: 'Sign in',
                        underlined: true,
                        onTapped: () async {
                          await ref.read(authorizationStateProvider.notifier).setOnboarded();
                        },
                      ),
                    ],
                    textAlign: TextAlign.center,
                  )
                ],
              ),
            ),
          ),
          Positioned(
            bottom: 180,
            left: 0,
            right: 0,
            child: SmoothPageIndicator(
              controller: pageController,
              count: pages.length,
              effect: ExpandingDotsEffect(
                expansionFactor: 1.2,
                dotHeight: 8,
                dotWidth: 40,
                radius: 4,
                dotColor: Colors.white.withOpacity(0.5),
                activeDotColor: Colors.white,
              ),
            ).centerAlign(),
          ),
        ],
      ),
    );
  }
}

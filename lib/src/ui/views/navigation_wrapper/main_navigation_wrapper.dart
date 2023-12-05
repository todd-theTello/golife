import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:iconsax/iconsax.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

import '../finance_goals/finance_goals.dart';
import '../home/home.dart';
import '../insurance/insurance.dart';
import '../investments/investments.dart';

/// holds the main pages of the app as well as the bottom navigation wrapper of navigation drawer
class MainNavigationWrapper extends ConsumerStatefulWidget {
  /// constructor
  const MainNavigationWrapper({super.key});

  @override
  ConsumerState createState() => _MainNavigationWrapperState();
}

class _MainNavigationWrapperState extends ConsumerState<MainNavigationWrapper> {
  final ValueNotifier<int> selectedPageIndex = ValueNotifier(0);
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
        valueListenable: selectedPageIndex,
        builder: (context, page, _) {
          return Scaffold(
            bottomNavigationBar: NavigationBar(
              selectedIndex: page,
              destinations: const [
                NavigationDestination(icon: Icon(Iconsax.home), label: 'Home', selectedIcon: Icon(Iconsax.home5)),
                NavigationDestination(
                  icon: Icon(PhosphorIconsRegular.currencyCircleDollar),
                  label: 'Insurance',
                  selectedIcon: Icon(PhosphorIconsFill.currencyCircleDollar),
                ),
                NavigationDestination(
                    icon: Icon(PhosphorIconsRegular.target),
                    label: 'Finance Goals',
                    selectedIcon: Icon(PhosphorIconsFill.target)),
                NavigationDestination(
                  icon: Icon(PhosphorIconsRegular.handCoins),
                  label: 'Investments',
                  selectedIcon: Icon(PhosphorIconsFill.handCoins),
                ),
              ],
              onDestinationSelected: (index) {
                selectedPageIndex.value = index;
              },
            ),
            body: IndexedStack(
              index: page,
              children: const [HomeView(), InsuranceView(), FinanceGoalsView(), InvestmentsView()],
            ),
          );
        });
  }
}

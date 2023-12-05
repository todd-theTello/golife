import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../widgets/app_bars/app_bars.dart';

/// User investment details views
/// This view shows details about a users investment
class UserInvestmentDetailsView extends ConsumerStatefulWidget {
  /// constructors
  const UserInvestmentDetailsView({super.key});

  @override
  ConsumerState createState() => _UserInvestmentDetailsViewState();
}

class _UserInvestmentDetailsViewState extends ConsumerState<UserInvestmentDetailsView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const DefaultAppBar(title: 'Investment details'),
      body: ListView(
        children: [],
      ),
    );
  }
}

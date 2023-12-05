import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

/// Investments view
class InvestmentsView extends ConsumerStatefulWidget {
  /// constructor
  const InvestmentsView({super.key});

  @override
  ConsumerState createState() => _InvestmentsViewState();
}

class _InvestmentsViewState extends ConsumerState<InvestmentsView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}

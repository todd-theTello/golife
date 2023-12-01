import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:iconsax/iconsax.dart';
import 'package:intl/intl.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

import '../../../../utils/extensions/widget.dart';
import '../../themes/themes.dart';
import '../../widgets/app_bars/app_bars.dart';
import '../../widgets/circle_container.dart';
import '../home/home.dart';

part 'user_insurance_policy_details.dart';

/// Insurance view
class InsuranceView extends ConsumerStatefulWidget {
  /// constructor
  const InsuranceView({super.key});

  @override
  ConsumerState createState() => _InsuranceViewState();
}

class _InsuranceViewState extends ConsumerState<InsuranceView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}

import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pinput/pinput.dart';

import '../../../../utils/extensions/num.dart';
import '../../../../utils/extensions/widget.dart';
import '../../../../utils/mixins/input_validation_mixins.dart';
import '../../../core/states/authorization/authorization_states_notifier.dart';
import '../../themes/themes.dart';
import '../../widgets/app_bars/app_bars.dart';
import '../../widgets/buttons/buttons.dart';
import '../../widgets/rich_text/rich_text.dart';
import '../../widgets/text_fields/text_field_with_validator.dart';

part 'forgot_password.dart';
part 'sign_in.dart';
part 'sign_up.dart';
part 'verify_otp.dart';

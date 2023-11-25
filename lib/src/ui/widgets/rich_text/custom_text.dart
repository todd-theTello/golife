import 'package:flutter/foundation.dart' show VoidCallback, immutable;

import 'base_text.dart';

@immutable

/// class to define custom text
class CustomText extends BaseText {
  /// custom text constructor
  const CustomText({required super.text, this.onTapped, bool? underlined, super.style})
      : underlined = underlined ?? false;

  /// void function to define actions when tapped
  final VoidCallback? onTapped;

  /// flags whether the text should be underlined or not,
  /// does not apply if a text style is provided in the constructor
  final bool underlined;
}

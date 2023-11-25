import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import '../../themes/themes.dart';
import 'base_text.dart';
import 'custom_text.dart';

/// Custom text widget
class RichTextWidget extends StatelessWidget {
  /// constructor
  const RichTextWidget({
    required this.texts,
    this.styleForAll,
    this.customStyle,
    this.textAlign,
    this.maxLines,
    super.key,
  });

  /// iterable of texts in the rich text widget

  final TextStyle? styleForAll;

  /// Default style for all texts

  final TextStyle? customStyle;

  /// Style applied to custom text

  final Iterable<BaseText> texts;

  /// Text alignment

  final TextAlign? textAlign;

  /// Text alignment

  final int? maxLines;
  @override
  Widget build(BuildContext context) {
    return RichText(
      textAlign: textAlign ?? TextAlign.start,
      maxLines: maxLines,
      text: TextSpan(
          children: texts.map(
        (baseText) {
          if (baseText is CustomText) {
            return TextSpan(
              text: baseText.text,
              style: baseText.style ??
                  customStyle ??
                  kBody3(fontWeight: FontWeight.w500, color: kPrimaryColor100).copyWith(
                    decoration: baseText.underlined ? TextDecoration.underline : null,
                  ),
              recognizer: TapGestureRecognizer()..onTap = baseText.onTapped,
            );
          } else {
            return TextSpan(
              text: baseText.text,
              style: baseText.style ?? styleForAll ?? kBody3(fontWeight: FontWeight.w500),
            );
          }
        },
      ).toList()),
    );
  }
}

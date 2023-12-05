import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

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
    final theme = Theme.of(context);
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
                  theme.textTheme.bodySmall?.copyWith(
                    fontWeight: FontWeight.w700,
                    color: theme.primaryColorLight,
                    decoration: baseText.underlined ? TextDecoration.underline : null,
                    decorationColor: baseText.underlined ? theme.colorScheme.secondary : null,
                  ),
              recognizer: TapGestureRecognizer()..onTap = baseText.onTapped,
            );
          } else {
            return TextSpan(
              text: baseText.text,
              style: baseText.style ?? styleForAll ?? theme.textTheme.bodySmall?.copyWith(fontWeight: FontWeight.w500),
            );
          }
        },
      ).toList()),
    );
  }
}

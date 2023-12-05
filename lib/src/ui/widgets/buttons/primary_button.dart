part of 'buttons.dart';

// TODO(todd-TheTello): Document code
///
class PrimaryButton extends StatelessWidget {
  ///
  const PrimaryButton({
    required this.buttonText,
    required this.onPressed,
    this.onLongPressed,
    bool? isActive,
    this.child,
    this.padding,
    this.leftPadding,
    this.topPadding,
    this.rightPadding,
    this.bottomPadding,
    this.buttonTextStyle,
    super.key,
  }) : isActive = isActive ?? false;

  ///
  final String buttonText;

  ///
  final VoidCallback onPressed;

  ///
  final VoidCallback? onLongPressed;

  ///
  final Widget? child;

  ///
  final bool isActive;

  ///
  final EdgeInsetsGeometry? padding;

  ///
  final double? leftPadding;

  ///
  final double? topPadding;

  ///
  final double? rightPadding;

  ///
  final double? bottomPadding;

  ///
  final TextStyle? buttonTextStyle;
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return CustomAnimatedScale(
      onPressed: onPressed,
      onLongPress: onLongPressed,
      child: Container(
        alignment: Alignment.center,
        padding: padding ??
            EdgeInsets.fromLTRB(
              leftPadding ?? 12,
              topPadding ?? 16,
              rightPadding ?? 12,
              bottomPadding ?? 16,
            ),
        decoration: BoxDecoration(
          color: isActive ? theme.primaryColor : greyScale.shade600,
          borderRadius: BorderRadius.circular(8),
        ),
        child: child ?? Text(buttonText, maxLines: 1, style: kButtonText()),
      ),
    );
  }
}

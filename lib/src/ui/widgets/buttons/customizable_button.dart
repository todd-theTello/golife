part of 'buttons.dart';

///
class CustomizableButton extends StatelessWidget {
  ///
  const CustomizableButton({
    required this.buttonText,
    required this.onPressed,
    this.onLongPressed,
    this.backgroundColor,
    this.foregroundColor,
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
  final Color? backgroundColor;

  ///
  final Color? foregroundColor;

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
      onLongPress: onPressed,
      child: Container(
        alignment: Alignment.center,
        padding: padding ??
            EdgeInsets.fromLTRB(
              leftPadding ?? 12,
              topPadding ?? 12,
              rightPadding ?? 12,
              bottomPadding ?? 12,
            ),
        decoration: BoxDecoration(
          color: isActive
              ? backgroundColor ?? theme.primaryColor
              : backgroundColor?.withOpacity(0.3) ?? greyScale.shade600,
          borderRadius: BorderRadius.circular(8),
        ),
        child: child ??
            Text(
              buttonText,
              maxLines: 1,
              style: kButtonText().copyWith(
                color: foregroundColor ?? (isActive ? Colors.white : greyScale.shade300),
              ),
            ),
      ),
    );
  }
}

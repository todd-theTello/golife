part of 'themes.dart';

/// heading text style
TextStyle kHeading1({Color? color, FontWeight? fontWeight, double? height}) {
  return TextStyle(
    fontSize: 20,
    color: color,
    height: height ?? 24 / 20,
    fontWeight: fontWeight ?? FontWeight.w600,
  );
}

/// heading text style
TextStyle kHeading2({Color? color, FontWeight? fontWeight, double? height}) {
  return TextStyle(
    fontSize: 16,
    color: color,
    height: height ?? 22 / 16,
    fontWeight: fontWeight ?? FontWeight.w600,
  );
}

/// heading text style
TextStyle kButtonText({Color? color}) => TextStyle(
      fontWeight: FontWeight.w500,
      color: color ?? const Color(0xFFF4F5F7),
      fontSize: 16,
      height: 1,
    );

/// heading text style
TextStyle kBody1({Color? color, FontWeight? fontWeight, double? height}) {
  return TextStyle(
    fontSize: 16,
    height: height ?? 20 / 16,
    color: color,
    fontWeight: fontWeight ?? FontWeight.w400,
  );
}

/// heading text style
TextStyle kBody2({Color? color, FontWeight? fontWeight, double? height}) {
  return TextStyle(
    fontSize: 14,
    color: color,
    height: height ?? 20 / 14,
    fontWeight: fontWeight ?? FontWeight.w400,
  );
}

/// heading text style
TextStyle kBody3({Color? color, FontWeight? fontWeight, double? height}) {
  return TextStyle(
    fontSize: 12,
    height: height ?? 16 / 12,
    color: color ?? const Color(0xFF555555),
    fontWeight: fontWeight ?? FontWeight.w400,
  );
}

/// heading text style
TextStyle kOverview({Color? color, FontWeight? fontWeight, double? height}) {
  return TextStyle(
    fontSize: 10,
    color: color,
    height: height ?? 12 / 10,
    fontWeight: fontWeight ?? FontWeight.w400,
  );
}

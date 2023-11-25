import 'package:flutter/material.dart';

extension T on Widget {
  ///
  Widget visibility({required bool isVisible}) {
    return Visibility(visible: isVisible, child: this);
  }

  /// wrap widget with icon button
  Widget iconButton({required void Function() onTap, EdgeInsetsGeometry? padding}) {
    return IconButton(padding: padding, onPressed: onTap, icon: this);
  }

  /// padding from left top right bottom
  Widget paddingLTRB(double left, double top, double right, double bottom) {
    return Padding(
      padding: EdgeInsets.fromLTRB(left, top, right, bottom),
      child: this,
    );
  }

  /// symmetric padding on child
  Widget paddingSymmetric({double? horizontal, double? vertical}) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: horizontal ?? 0,
        vertical: vertical ?? 0,
      ),
      child: this,
    );
  }

  /// padding from left top right bottom
  Widget paddingOnly({double? left, double? top, double? right, double? bottom}) {
    return Padding(
      padding: EdgeInsets.only(
        left: left ?? 0,
        top: top ?? 0,
        right: right ?? 0,
        bottom: bottom ?? 0,
      ),
      child: this,
    );
  }

  /// padding from left top right bottom
  Widget sliverPaddingLTRB(double left, double top, double right, double bottom) {
    return SliverPadding(
      padding: EdgeInsets.fromLTRB(left, top, right, bottom),
      sliver: this,
    );
  }

  /// symmetric padding on child
  Widget sliverPaddingSymmetric({double? horizontal, double? vertical}) {
    return SliverPadding(
      padding: EdgeInsets.symmetric(
        horizontal: horizontal ?? 0,
        vertical: vertical ?? 0,
      ),
      sliver: this,
    );
  }

  /// padding from left top right bottom
  Widget sliverPaddingOnly({double? left, double? top, double? right, double? bottom}) {
    return SliverPadding(
      padding: EdgeInsets.only(
        left: left ?? 0,
        top: top ?? 0,
        right: right ?? 0,
        bottom: bottom ?? 0,
      ),
      sliver: this,
    );
  }

  ///
  Widget center() => Center(
        child: this,
      );

  ///
  Widget centerAlign() => Align(
        child: this,
      );

  ///
  Widget centerLeftAlign() => Align(
        alignment: Alignment.centerLeft,
        child: this,
      );

  ///
  Widget centerRightAlign() => Align(
        alignment: Alignment.centerRight,
        child: this,
      );

  ///
  Widget topCenterAlign() => Align(
        alignment: Alignment.topCenter,
        child: this,
      );

  ///
  Widget topLeftAlign() => Align(
        alignment: Alignment.topLeft,
        child: this,
      );

  ///
  Widget topRightAlign() => Align(
        alignment: Alignment.topRight,
        child: this,
      );

  ///
  Widget bottomCenterAlign() => Align(
        alignment: Alignment.bottomCenter,
        child: this,
      );

  ///
  Widget bottomLeftAlign() => Align(
        alignment: Alignment.bottomLeft,
        child: this,
      );

  ///
  Widget bottomRightAlign() => Align(
        alignment: Alignment.bottomRight,
        child: this,
      );

  ///
  Widget expanded({int? flex}) => Expanded(
        flex: flex ?? 1,
        child: this,
      );
}

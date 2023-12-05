import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../../utils/extensions/widget.dart';
import '../../themes/themes.dart';

class DefaultTextField extends StatelessWidget {
  const DefaultTextField({
    required this.controller,
    required this.labelText,
    this.hintText,
    this.keyboardType,
    this.onTap,
    this.onChanged,
    this.inputFormatters,
    this.readOnly,
    this.labelTextStyle,
    this.decoration,
    this.filled,
    this.fillColor,
    this.suffixIcon,
    String? errorText,
    bool? validField,
    super.key,
  })  : errorText = errorText ?? '',
        validField = validField ?? true;
  final TextEditingController controller;
  final String labelText;
  final String? hintText;
  final String errorText;
  final bool validField;
  final bool? readOnly;
  final List<TextInputFormatter>? inputFormatters;
  final TextStyle? labelTextStyle;
  final bool? filled;
  final Color? fillColor;
  final InputDecoration? decoration;
  final Widget? suffixIcon;
  final TextInputType? keyboardType;
  final void Function()? onTap;
  final void Function()? onChanged;

  @override
  Widget build(BuildContext context) {
    final ValueNotifier<bool> fieldIsValid = ValueNotifier(true);
    return ValueListenableBuilder(
        valueListenable: fieldIsValid,
        builder: (context, valid, _) {
          Timer? debounceTimer;
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextField(
                style: kBody2(),
                inputFormatters: inputFormatters,
                controller: controller,
                readOnly: readOnly ?? false,
                keyboardType: keyboardType,
                onTapOutside: (_) {
                  final FocusScopeNode currentFocus = FocusScope.of(context);
                  if (!currentFocus.hasPrimaryFocus && currentFocus.focusedChild != null) {
                    FocusManager.instance.primaryFocus?.unfocus();
                  }
                },
                decoration: decoration ??
                    InputDecoration(
                      filled: filled,
                      fillColor: fillColor,
                      hintText: hintText,
                      suffixIcon: suffixIcon,
                      labelText: labelText,
                      floatingLabelBehavior: FloatingLabelBehavior.always,
                    ),
                onTap: onTap,
                onChanged: (value) {
                  // if (validField == false) {
                  //   if (debounceTimer?.isActive ?? false) debounceTimer?.cancel();
                  //   debounceTimer = Timer(const Duration(seconds: 3), () {
                  //     fieldIsValid.value = validField;
                  //   });
                  // }
                  fieldIsValid.value = validField;

                  onChanged?.call();
                },
              ),
              Text(errorText, style: kBody3(color: Colors.red)).visibility(isVisible: !valid),
            ],
          );
        });
  }
}

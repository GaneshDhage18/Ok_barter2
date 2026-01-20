import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:okbarter2/core/const/colours.dart';
import 'package:pinput/pinput.dart';


PinTheme defaultPinTheme() {
  return PinTheme(
    width: 78.w,
    height: 61.h,
    textStyle: const TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(12),
      border: Border.all(color: Colors.grey.shade400),
      color: Colours.primary.withOpacity(0.10),
    ),
  );
}

PinTheme focusedPinTheme() {
  return defaultPinTheme().copyWith(
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(12),
      border: Border.all(color: Colours.primary, width: 2),
    ),
  );
}

PinTheme submittedPinTheme() {
  return defaultPinTheme().copyWith(
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(12),
      color: Colours.primary.withOpacity(0.10),
      border: Border.all(color: Colors.grey),
    ),
  );
}

PinTheme errorPinTheme() {
  return defaultPinTheme().copyWith(
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(12),
      border: Border.all(color: Colors.red, width: 2),
    ),
  );
}

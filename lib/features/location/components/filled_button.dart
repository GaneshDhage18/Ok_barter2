import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:okbarter2/core/const/colours.dart';
import 'package:okbarter2/core/const/fonts.dart';

FilledButton filledButton({ required VoidCallback onPressed, required String title}) {
  return FilledButton(
    onPressed: onPressed,
    style: ButtonStyle(
      backgroundColor: WidgetStatePropertyAll(Colours.primary),
      shape: WidgetStatePropertyAll(
        RoundedRectangleBorder(
          borderRadius: BorderRadiusGeometry.circular(16.r),
        ),
      ),
    ),

    child: Text(
      title,
      style: TextStyle(
        fontSize: 16.sp,
        fontFamily: Fonts.sBold,
        color: Colours.white,
      ),
    ),
  );
}

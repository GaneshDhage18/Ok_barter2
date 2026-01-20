import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


import '../../../core/extensions/app_imports.dart';

Widget customTextFormField({
  required String hintText,
  TextEditingController? controller,
  VoidCallback? onTap,
  ValueChanged<String>? onChanged,
  bool readOnly = false,
}) {
  return SizedBox(
    height: 50.h,
    child: TextFormField(
      controller: controller,
      onTap: onTap,
      onChanged: onChanged,
      readOnly: readOnly,
      style: TextStyle(
        color: Colours.primary,
        fontFamily: Fonts.sRegular,
        fontSize: 16.sp,
      ),
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: TextStyle(
          color: Colours.primary,
          fontFamily: Fonts.sRegular,
          fontSize: 16.sp,
        ),
        prefixIcon: Icon(
          Icons.search,
          color: Colours.primary.withOpacity(0.9),
          size: 22.sp,
        ),
        contentPadding: EdgeInsets.symmetric(horizontal: 12.w),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.r),
          borderSide: BorderSide(color: Colours.primary.withOpacity(0.5)),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.r),
          borderSide: BorderSide(color: Colours.primary),
        ),
      ),
    ),
  );
}

Widget sectionHeader({title, subtitle, ontap}) {
  return Padding(
    padding: EdgeInsets.symmetric(horizontal: 24.w),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: TextStyle(
            color: Colours.black222222,
            fontFamily: Fonts.sSemiBold,
            fontSize: 18.sp,
          ),
        ),
        TextButton(
          onPressed: ontap,
          child: Text(
            subtitle,
            style: TextStyle(
              color: Colours.blue66B9DF,
              fontFamily: Fonts.sRegular,
              fontSize: 14.sp,
            ),
          ),
        ),
      ],
    ),
  );
}

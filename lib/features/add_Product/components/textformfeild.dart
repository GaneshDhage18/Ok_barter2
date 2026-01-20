import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomTextFormField extends StatelessWidget {
  final TextEditingController? controller;
  final String? hintText;
  final int? maxLines;
  final TextInputType? keyboardType;
  final bool readOnly;
  final VoidCallback? onTap;
  final Widget? suffixIcon;
  final bool isrequired;

  const CustomTextFormField({
    this.isrequired = false,
    super.key,
    this.controller,
    this.hintText,
    this.maxLines = 1,
    this.keyboardType,
    this.readOnly = false,
    this.onTap,
    this.suffixIcon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: maxLines == 1 ? 48.h : null,
      padding: const EdgeInsets.symmetric(horizontal: 12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey.shade300),
      ),
      alignment: Alignment.center,
      child: TextFormField(
        validator: isrequired
            ? (value) {
                if (value == null || value.trim().isEmpty) {
                  return 'Required';
                }

                // ✅ Auto date validation if keyboard is datetime
                if (keyboardType == TextInputType.datetime) {
                  final regex = RegExp(r'^\d{2}/\d{2}/\d{4}$');
                  if (!regex.hasMatch(value.trim())) {
                    return 'Use MM/DD/YYYY';
                  }
                }

                return null;
              }
            : null,
        controller: controller,
        maxLines: maxLines,
        keyboardType: keyboardType,
        readOnly: readOnly,
        onTap: onTap,
        decoration: InputDecoration(
          hintText: hintText,
          border: InputBorder.none,
          suffixIcon: suffixIcon,
        ),
      ),
    );
  }
}

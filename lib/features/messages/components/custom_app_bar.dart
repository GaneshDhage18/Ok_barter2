import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:okbarter2/core/const/colours.dart';
import 'package:okbarter2/core/const/fonts.dart';
import 'package:okbarter2/core/extensions/sizedbox_extension.dart';

class CustomAppBar extends StatelessWidget {
  final String title;
  final Widget child;

  const CustomAppBar({super.key, required this.title, required this.child});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colours.darkprimary,
      body: SizedBox(
        width: double.infinity,
        child: Column(
          children: [
            58.heightBox,
            Text(
              title,
              style: TextStyle(
                fontFamily: Fonts.sMedium,
                fontSize: 24.sp,
                color: Colours.white,
              ),
            ),
            24.heightBox,
            Expanded(
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colours.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(24.r),
                    topRight: Radius.circular(24.r),
                  ),
                ),
                child: child,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

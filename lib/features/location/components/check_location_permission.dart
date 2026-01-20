import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:okbarter2/core/const/colours.dart';
import 'package:okbarter2/core/const/fonts.dart';
import 'package:okbarter2/core/extensions/sizedbox_extension.dart';

import 'package:okbarter2/core/routes/router.dart';
import 'package:permission_handler/permission_handler.dart';

Future<void> checkLocationPermission(BuildContext context) async {
  final status = await Permission.location.status;

  if (status.isGranted) {
    // Location already ON → move forward
    goRouter.goNamed(Routes.confirmLocationScreen.name);
    return;
  }

  if (status.isDenied) {
    // First-time or previously denied → ask permission
    final result = await Permission.location.request();

    if (result.isGranted) {
      goRouter.goNamed(Routes.confirmLocationScreen.name);
    }
  }

  if (status.isPermanentlyDenied) {
    // User said "Don't ask again"
    WidgetsBinding.instance.addPostFrameCallback((_) {
      openDialogBox(context);
    });
  }
}

openDialogBox(context) {
  showDialog(
    context: context,
    barrierDismissible: true,
    barrierColor: Colors.transparent,
    builder: (_) {
      return Center(
        child: Container(
          width: 330.w,
          height: 160.h,
          padding: EdgeInsets.only(
            top: 28.h,
            left: 24.w,
            right: 22.w,
            // bottom: 22.h,
          ),
          decoration: BoxDecoration(
            color: Colours.whiteF1F6FF,
            borderRadius: BorderRadius.circular(16.r),
          ),
          child: Material(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'For better  experience, turn on device location',
                  style: TextStyle(
                    color: Colours.black,
                    fontSize: 18.sp,
                    fontFamily: Fonts.sRegular,
                  ),
                ),
                24.heightBox,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextButton(
                      onPressed: () {
                        goRouter.pop();
                      },
                      child: Padding(
                        padding: EdgeInsets.only(left: 100.w),
                        child: Text(
                          'No, thanks',
                          style: TextStyle(
                            color: Colours.blue003CB8,
                            fontSize: 18.sp,
                            fontFamily: Fonts.sRegular,
                          ),
                        ),
                      ),
                    ),
                    TextButton(
                      onPressed: () async {
                        await openAppSettings();
                        goRouter.goNamed(Routes.confirmLocationScreen.name);
                      },
                      child: Text(
                        'Ok',
                        style: TextStyle(
                          color: Colours.blue003CB8,
                          fontSize: 18.sp,
                          fontFamily: Fonts.sRegular,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      );
    },
  );
}

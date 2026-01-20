import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:okbarter2/core/const/colours.dart';
import 'package:okbarter2/core/const/fonts.dart';
import 'package:okbarter2/core/const/urls.dart';
import 'package:okbarter2/core/extensions/sizedbox_extension.dart';
import 'package:okbarter2/core/routes/router.dart';
import 'package:okbarter2/features/location/components/check_location_permission.dart';
import 'package:okbarter2/features/location/components/filled_button.dart';
import 'package:permission_handler/permission_handler.dart';

class LocationScreen extends StatelessWidget {
  const LocationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colours.darkprimary,
      body: SizedBox(
        width: double.infinity,
        child: Column(
          children: [
            125.heightBox,
            SizedBox(
              height: 288.h,
              width: 344.w,
              child: Image.asset(Assets.igsplashLocationLogo),
            ),
            Spacer(),
            Container(
              height: 331.h,
              color: Colours.whiteFFFCFC,
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 26.w, right: 8.w, top: 4.h),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Location Switch off',
                          style: TextStyle(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                        IconButton(
                          onPressed: () {},
                          icon: Icon(Icons.close, color: Colours.black212121),
                        ),
                      ],
                    ),
                  ),
                  18.heightBox,
                  Container(
                    height: 160.h,
                    padding: EdgeInsets.symmetric(horizontal: 44.w),
                    color: Colours.whiteEEF4FF,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Turn on\n Location',
                          style: TextStyle(
                            fontSize: 28.sp,
                            fontFamily: Fonts.sSemiBold,
                          ),
                        ),
                        Image.asset(
                          Assets.igTurnOnLocationIcon,
                          height: 100.h,
                          width: 100.w,
                        ),
                      ],
                    ),
                  ),
                  24.heightBox,
                  Padding(
                    padding: EdgeInsets.only(
                      left: 24.w,
                      right: 24.w,
                      bottom: 20.h,
                    ),
                    child: SizedBox(
                      width: double.infinity,
                      height: 58.h,
                      child: filledButton(
                        onPressed: () async {
                          final status = await Permission.location.request();

                          if (status.isGranted) {
                            goRouter.goNamed(Routes.confirmLocationScreen.name);
                          } else if (status.isPermanentlyDenied) {
                            openDialogBox(context);
                          }
                        },
                        title: 'Turn on location',
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

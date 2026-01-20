import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:okbarter2/core/const/colours.dart';

import 'package:okbarter2/core/extensions/sizedbox_extension.dart';
import 'package:okbarter2/core/routes/router.dart';
import 'package:okbarter2/features/Account/components/custome_tile.dart';


class AccountScreen extends StatelessWidget {
  const AccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF63B7D6), // primary blue
      body: SafeArea(
        bottom: false,
        child: Column(
          children: [
            // ================= HEADER =================
            60.heightBox,
            Text(
              "Account",
              style: TextStyle(
                fontSize: 22.sp,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            60.heightBox,

            // ================= WHITE CONTENT =================
            Expanded(
              child: Container(
                padding: EdgeInsets.all(16.w),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(24.r),
                  ),
                ),
                child: ListView(
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: 16.w,
                        vertical: 20.h,
                      ),
                      child: Row(
                        children: [
                          CircleAvatar(
                            radius: 32.r,
                            backgroundColor: Colours.primary,
                            child: Text(
                              'N',
                              style: TextStyle(
                                fontSize: 22.sp,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                          ),
                          15.widthBox,
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'nayan',
                                style: TextStyle(
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),
                              ),

                              Text(
                                'dev.nayanmhaske@gmail.com',
                                style: TextStyle(
                                  fontSize: 14.sp,
                                  color: Colors.grey,
                                ),
                              ),

                              TextButton(
                                style: TextButton.styleFrom(
                                  padding: EdgeInsets.zero,
                                  // minimumSize: Size.zero,
                                  tapTargetSize:
                                      MaterialTapTargetSize.shrinkWrap,
                                ),
                                onPressed: () {},
                                child: Text(
                                  "Edit Profile",
                                  style: TextStyle(
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.bold,
                                    color: Colours.primary,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Divider(color: Colors.grey.withOpacity(0.20)),
                    Text(
                      'General Settings',
                      style: TextStyle(
                        fontSize: 18.sp,
                        fontWeight: FontWeight.bold,
                        color: const Color(0xFF63B7D6),
                      ),
                    ),
                    SizedBox(height: 12.h),

                    tile(
                      'Wishlist',
                      "View your saved items",
                      onTap: () {
                        goRouter.goNamed(Routes.wishListScreen.name);
                      },
                    ),
                    tile(
                      'Settings',
                      'Privacy and logout',
                      onTap: () {
                        goRouter.goNamed(Routes.settingsScreen.name);
                      },
                    ),
                    tile(
                      'Help and Support',
                      'Help center and legal terms',
                      onTap: () {
                        goRouter.goNamed(Routes.helpandsupportScreen.name);
                      },
                    ),
                    tile(
                      'Rate Us',
                      'If you love our app, please rate it',
                      onTap: () {},
                    ),
                    tile(
                      'Invite friend to Ok Barter',
                      'Invite your friends to barter',
                      onTap: () {},
                    ),
                    tile('Log Out', 'Logging out from Ok Barter', onTap: () {}),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

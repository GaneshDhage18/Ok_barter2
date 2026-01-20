import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:okbarter2/core/extensions/sizedbox_extension.dart';
import 'package:okbarter2/core/routes/router.dart';
import 'package:okbarter2/features/Account/components/alert_dialoge.dart';
import 'package:okbarter2/features/Account/components/custome_tile.dart';


class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          37.heightBox,
          Padding(
            padding: EdgeInsets.only(left: 20.w),
            child: Row(
              children: [
                IconButton(
                  style: ButtonStyle(),
                  onPressed: () {
                    goRouter.pop();
                  },
                  icon: Icon(Icons.arrow_back),
                ),
                20.widthBox,
                Text(
                  "Settings",
                  style: TextStyle(
                    fontSize: 18.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          Divider(),
          20.heightBox,
          SizedBox(
            width: double.infinity,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 14.w),
              child: tile(
                "Delete Account",
                "Permanately delete your okBarter account",
                onTap: () {
                  showDeleteAccountDialog(context, onConfirm: () {});
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}

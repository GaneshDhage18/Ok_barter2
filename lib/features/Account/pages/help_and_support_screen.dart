import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:okbarter2/core/extensions/sizedbox_extension.dart';
import 'package:okbarter2/core/routes/router.dart';
import 'package:okbarter2/features/Account/components/custome_tile.dart';


class HelpAndSupportScreen extends StatelessWidget {
  const HelpAndSupportScreen({super.key});

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
                  "Help And Support",
                  style: TextStyle(
                    fontSize: 18.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          Divider(),
          Padding(
            padding: const EdgeInsets.all(18),
            child: Column(
              children: [
                SizedBox(
                  width: double.infinity,
                  child: tile(
                    "Get Help",
                    "FAQ & contact support",
                    onTap: () {},
                  ),
                ),
                SizedBox(
                  width: double.infinity,
                  child: tile(
                    "Terms and Condition",
                    "FAQ & contact support",
                    onTap: () {},
                  ),
                ),
                SizedBox(
                  width: double.infinity,
                  child: tile(
                    "Privacy Policy",
                    "FAQ & contact support",
                    onTap: () {},
                  ),
                ),
                SizedBox(
                  width: double.infinity,
                  child: tile("1.0.0", "App Version", onTap: () {}),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

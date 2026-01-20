import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:okbarter2/core/const/colours.dart';
import 'package:okbarter2/core/extensions/sizedbox_extension.dart';
import 'package:okbarter2/core/routes/router.dart';


class WishlistScreen extends StatelessWidget {
  const WishlistScreen({super.key});

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
                  "Wishlist",
                  style: TextStyle(
                    fontSize: 18.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          Divider(),
          350.heightBox,
          Center(
            child: Text(
              "No Saved Products",
              style: TextStyle(
                fontSize: 28.sp,
                color: Colours.primary,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

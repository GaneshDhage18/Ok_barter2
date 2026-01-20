import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ok_barter/core/const/colours.dart';
import 'package:ok_barter/core/const/fonts.dart';

Widget productCard({img, price, productName, location, date, ontap}) {
  return Stack(
    children: [
      GestureDetector(
        onTap: ontap,
        child: Container(
          padding: EdgeInsets.only(
            top: 10.h,
            left: 10.w,
            right: 10.w,
            bottom: 10.h,
          ),
          margin: EdgeInsets.only(right: 16.w),
          height: 190.h,
          width: 170.w,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16.r),
            border: Border.all(color: Colours.grey9B9B9B.withOpacity(0.10)),
          ),
          child: Column(
            children: [
              SizedBox(height: 100.h, width: 100.w, child: Image.network(img)),
              Spacer(),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "₹$price",
                    style: TextStyle(
                      color: Colours.primary,
                      fontFamily: Fonts.sSemiBold,
                      fontSize: 18.sp,
                    ),
                  ),
                  Text(
                    productName,
                    style: TextStyle(
                      color: Colours.black222222,
                      fontFamily: Fonts.sSemiBold,
                      fontSize: 14.sp,
                    ),
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.location_on_rounded,
                        color: Colours.grey9B9B9B,
                        size: 12,
                      ),
                      Text(
                        location,
                        style: TextStyle(
                          color: Colours.grey9B9B9B,
                          fontFamily: Fonts.sRegular,
                          fontSize: 10.sp,
                        ),
                      ),
                      Spacer(),
                      Text(
                        date,
                        style: TextStyle(
                          color: Colours.grey9B9B9B,
                          fontFamily: Fonts.sRegular,
                          fontSize: 10.sp,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),

      Positioned(
        top: 10,
        right: 25,
        child: Material(
          color: Colours.primary,
          shape: const CircleBorder(),
          child: InkWell(
            customBorder: const CircleBorder(),
            onTap: () {},
            child: SizedBox(
              height: 30.h,
              width: 30.h,
              child: Icon(
                Icons.favorite_border,
                color: Colors.white,
                size: 16.sp,
              ),
            ),
          ),
        ),
      ),
    ],
  );
}

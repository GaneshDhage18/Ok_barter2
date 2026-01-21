import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:okbarter2/core/extensions/app_imports.dart';
import 'package:okbarter2/features/product_details/components/product_img_slider.dart';
import 'package:okbarter2/features/product_details/list/list.dart';

class ProductDetailsScreen extends StatelessWidget {
  const ProductDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colours.primary,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(80.h),
        child: AppBar(
          backgroundColor: Colours.primary,
          automaticallyImplyLeading: false,
          centerTitle: true,

          elevation: 0,
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back_ios_new,
              color: Colors.white,
              size: 22.sp,
              weight: 700,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),

          title: Text(
            "Rockerz 460",
            style: TextStyle(
              color: Colors.white,
              fontFamily: Fonts.sSemiBold,
              fontSize: 20.sp,
            ),
          ),

          actions: [
            IconButton(
              icon: Icon(Icons.more_horiz, color: Colors.white),
              onPressed: () {},
            ),
          ],
        ),
      ),

      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(16.r),
            topRight: Radius.circular(16.r),
          ),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              20.heightBox,
              ProductImageSlider(productImages: productImages),
              30.heightBox,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Rockerz 460",
                    style: TextStyle(
                      color: Colours.black222222,
                      fontFamily: Fonts.sSemiBold,
                      fontSize: 16.sp,
                    ),
                  ),
                  Text(
                    "₹ 25000",
                    style: TextStyle(
                      color: Colours.black222222,
                      fontFamily: Fonts.sSemiBold,
                      fontSize: 16.sp,
                    ),
                  ),
                ],
              ),
              26.heightBox,
              Row(
                children: [
                  Icon(
                    Icons.location_on_rounded,
                    color: Colours.black424242,
                    size: 20.sp,
                  ),
                  6.widthBox,
                  Text(
                    "Chetana nagar",
                    style: TextStyle(
                      color: Colours.grey9B9B9B,
                      fontFamily: Fonts.sRegular,
                      fontSize: 16.sp,
                    ),
                  ),
                ],
              ),
              26.heightBox,
              Text(
                "Product Description",
                style: TextStyle(
                  color: Colours.black222222,
                  fontFamily: Fonts.sSemiBold,
                  fontSize: 16.sp,
                ),
              ),
              14.heightBox,
              Text(
                "Rockerz 460",
                style: TextStyle(
                  color: Colours.black616161,
                  fontFamily: Fonts.sMedium,
                  fontSize: 12.sp,
                ),
              ),
              26.heightBox,
              Text(
                "Owner",
                style: TextStyle(
                  color: Colours.black222222,
                  fontFamily: Fonts.sSemiBold,
                  fontSize: 16.sp,
                ),
              ),
              14.heightBox,

              Container(
                padding: EdgeInsets.symmetric(horizontal: 10.w),
                height: 56.h,
                width: double.infinity,
                decoration: BoxDecoration(
                  border: Border.all(color: Colours.grey9B9B9B),
                  borderRadius: BorderRadius.circular(8.r),
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      radius: 18.r,
                      backgroundColor: Colours.primary,
                      child: Text(
                        "K",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16.sp,
                          fontFamily: Fonts.sRegular,
                        ),
                      ),
                    ),
                    10.widthBox,
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,

                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Kunal Shinde",
                          style: TextStyle(
                            color: Colours.black222222,
                            fontSize: 14.sp,
                            fontFamily: Fonts.sSemiBold,
                          ),
                        ),
                        Text(
                          "Member since 5 January 2026",
                          style: TextStyle(
                            color: Colours.grey9B9B9B,
                            fontSize: 12.sp,
                            fontFamily: Fonts.sRegular,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

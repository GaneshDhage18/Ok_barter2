import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:okbarter2/core/const/colours.dart';
import 'package:okbarter2/core/const/fonts.dart';
import 'package:okbarter2/core/extensions/sizedbox_extension.dart';
import 'package:okbarter2/core/routes/router.dart';
import 'package:okbarter2/features/auth/models/landing_screen_model.dart';



class LandingScreen extends StatefulWidget {
  const LandingScreen({super.key});

  @override
  State<LandingScreen> createState() => _LandingScreenState();
}

class _LandingScreenState extends State<LandingScreen> {
  final PageController _pageController = PageController();
  int currentIndex = 0;

  final List<Color> backgroundColors = [
    Colours.landingColor1,
    Colours.landingColor2,
    Colours.primary,
  ];

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimatedContainer(
        duration: const Duration(milliseconds: 400),
        color: backgroundColors[currentIndex],
        child: Column(
          children: [
            Expanded(
              child: Stack(
                children: [
                  /// PageView (BACKGROUND)
                  PageView.builder(
                    controller: _pageController,
                    itemCount: onboardingData.length,
                    onPageChanged: (index) {
                      setState(() {
                        currentIndex = index;
                      });
                    },
                    itemBuilder: (context, index) {
                      final data = onboardingData[index];

                      return Padding(
                        padding: EdgeInsets.symmetric(horizontal: 24.w),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SvgPicture.asset(
                              data.image,
                              height: 260.h,
                              width: 345.w,
                            ),
                            40.heightBox,
                            Text(
                              data.title,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 28.sp,
                                fontFamily: Fonts.sSemiBold,
                                color: Colors.black,
                              ),
                            ),
                            16.heightBox,
                            Text(
                              data.description,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 18.sp,
                                fontFamily: Fonts.sRegular,
                                color: Colors.black,
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),

                  /// Skip Button (ON TOP)
                  if (currentIndex != onboardingData.length)
                    Positioned(
                      top: 68.h,
                      right: 24.w,
                      child: TextButton(
                        onPressed: () {
                          goRouter.goNamed(Routes.signUpScreen.name);
                        },
                        child: Text(
                          "Skip",
                          style: TextStyle(
                            fontFamily: Fonts.sSemiBold,
                            fontSize: 18.sp,
                            color: currentIndex == 1
                                ? Colors.black
                                : Colours.background,
                          ),
                        ),
                      ),
                    ),
                ],
              ),
            ),

            /// Dots Indicator
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                onboardingData.length,
                (index) => AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  margin: EdgeInsets.symmetric(horizontal: 4.w),
                  height: 10.h,
                  width: currentIndex == index ? 40.w : 20.w,
                  decoration: BoxDecoration(
                    color: currentIndex == index
                        ? Colors.black
                        : Colors.grey.shade400,
                    borderRadius: BorderRadius.circular(10.r),
                  ),
                ),
              ),
            ),

            50.heightBox,
          ],
        ),
      ),
    );
  }
}

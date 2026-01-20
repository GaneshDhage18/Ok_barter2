import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:okbarter2/core/const/colours.dart';
import 'package:okbarter2/core/const/urls.dart';


class BottomNavigationBarScreen extends StatelessWidget {
  final Widget child;

  const BottomNavigationBarScreen({super.key, required this.child});

  /// Shell routes
  static const List<String> routes = ['/home', '/profile'];

  static List<String> bottomIcons = [
    Assets.home,
    Assets.swap,
    Assets.cart,
    Assets.chat,
  ];

  int _getCurrentIndex(BuildContext context) {
    final location = GoRouterState.of(context).uri.toString();

    if (location.startsWith('/profile')) return 1;
    return 0;
  }

  @override
  Widget build(BuildContext context) {
    final currentIndex = _getCurrentIndex(context);

    return Scaffold(
      body: Stack(
        children: [
          /// Page Content
          Positioned.fill(child: child),

          /// SVG Bottom Navigation Background
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: SafeArea(
              top: false,
              child: Stack(
                children: [
                  SvgPicture.asset(
                    Assets.bottomNav,
                    width: MediaQuery.of(context).size.width,
                    fit: BoxFit.fill,
                  ),
                  Positioned(
                    top: 10.h,
                    left: 187.w,
                    child: Container(
                      height: 55.h,
                      width: 55.w,
                      decoration: BoxDecoration(
                        color: Colours.primary,
                        shape: BoxShape.circle,
                        border: Border.all(color: Colors.white, width: 2.w),
                        boxShadow: [
                          BoxShadow(
                            color: const Color(0xFF613EEA).withOpacity(0.35),
                            blurRadius: 12.r,
                            spreadRadius: 2.r,
                            offset: const Offset(0, 6),
                          ),
                        ],
                      ),
                      child: GestureDetector(
                        onTap: () {},
                        child: Center(
                          child: Icon(
                            Icons.add,
                            size: 40.sp, // ✅ NOW IT WILL INCREASE
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),

          /// Navigation Icons on top of SVG
          Positioned(
            left: 0,
            right: 0,
            bottom: 24.h,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: List.generate(routes.length, (index) {
                final isSelected = currentIndex == index;

                return GestureDetector(
                  onTap: () {
                    if (!isSelected) {
                      context.go(routes[index]);
                    }
                  },
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 200),
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: isSelected
                          ? Colors.white.withOpacity(0.25)
                          : Colors.transparent,
                    ),
                    child: SvgPicture.asset(
                      bottomIcons[index],
                      height: isSelected ? 27.h : 24.h,
                      width: isSelected ? 27.h : 24.h,

                      color: isSelected
                          ? Colours.primary
                          : Colors.grey.shade100,
                    ),
                  ),
                );
              }),
            ),
          ),
        ],
      ),
    );
  }
}

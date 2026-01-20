import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:okbarter2/core/const/colours.dart';
import 'package:okbarter2/core/const/urls.dart';

class BottomNavigationBarScreen extends StatelessWidget {
  final Widget child;

  const BottomNavigationBarScreen({super.key, required this.child});

  /// Bottom tabs
  static const List<String> routes = [
    '/home',
    '/messages',
    '/addproduct',
    '/AccountScreen',
  ];

  static List<String> bottomIcons = [
    Assets.home,
    Assets.chat,
    Assets.cart,
    Assets.person,
  ];

  /// Detect active tab
  int _getCurrentIndex(BuildContext context) {
    final location = GoRouterState.of(context).uri.path;

    for (int i = 0; i < routes.length; i++) {
      if (location.startsWith(routes[i])) {
        return i;
      }
    }
    return 0;
  }

  @override
  Widget build(BuildContext context) {
    final currentIndex = _getCurrentIndex(context);

    return Scaffold(
      body: Stack(
        children: [
          /// Page content
          Positioned.fill(child: child),

          /// Bottom SVG background + FAB
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: Stack(
              alignment: Alignment.bottomCenter,
              children: [
                SvgPicture.asset(
                  Assets.bottomNav,
                  width: MediaQuery.of(context).size.width,
                  fit: BoxFit.fill,
                ),

                /// Center FAB
                Positioned(
                  top: 10.h,
                  child: GestureDetector(
                    onTap: () => context.go('/addproduct'),
                    child: Container(
                      height: 55.h,
                      width: 55.w,
                      decoration: BoxDecoration(
                        color: Colours.primary,
                        shape: BoxShape.circle,
                        border: Border.all(color: Colors.white, width: 2.w),
                        boxShadow: [
                          BoxShadow(
                            color: Colours.primary.withOpacity(0.35),
                            blurRadius: 12.r,
                            offset: const Offset(0, 6),
                          ),
                        ],
                      ),
                      child: Center(
                        child: Icon(
                          Icons.add,
                          size: 40.sp,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),

          /// Bottom navigation icons
          Positioned(
            left: 0,
            right: 0,
            bottom: 24.h,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: List.generate(routes.length + 1, (i) {
                  /// Insert spacing AFTER 2nd icon
                  if (i == 2) {
                    return SizedBox(width: 30.w); // 👈 visual gap
                  }

                  final index = i > 2 ? i - 1 : i;
                  final isSelected = currentIndex == index;

                  return GestureDetector(
                    onTap: () {
                      if (!isSelected) {
                        context.go(routes[index]);
                      }
                    },
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 200),
                      padding: EdgeInsets.all(8.r),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: isSelected
                            ? Colours.primary.withOpacity(0.15)
                            : Colors.transparent,
                      ),
                      child: SvgPicture.asset(
                        bottomIcons[index],
                        height: isSelected ? 27.h : 24.h,
                        width: isSelected ? 27.h : 24.h,
                        color: isSelected ? Colours.primary : Colors.grey,
                      ),
                    ),
                  );
                }),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

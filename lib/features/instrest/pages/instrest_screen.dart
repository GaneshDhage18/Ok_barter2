import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:okbarter2/core/extensions/app_imports.dart';
import 'package:okbarter2/features/instrest/List/list.dart';
import 'package:okbarter2/features/instrest/bloc/instrest_bloc.dart';
import 'package:okbarter2/features/instrest/bloc/instrest_state.dart';

class InstrestScreen extends StatelessWidget {
  const InstrestScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        clipBehavior: Clip.none,
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 24.w),
            width: double.infinity,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  64.heightBox,
                  Text(
                    "Choose Your \ninterest",
                    style: TextStyle(
                      color: Colours.black212121,
                      fontSize: 32.sp,
                      fontFamily: Fonts.sSemiBold,
                    ),
                  ),
                  25.heightBox,
                  Text(
                    "Electronics",
                    style: TextStyle(
                      color: Colours.black616161,
                      fontSize: 18.sp,
                      fontFamily: Fonts.sSemiBold,
                    ),
                  ),
                  25.heightBox,
                  BlocBuilder<InstrestBloc, InstrestState>(
                    builder: (context, state) {
                      final selectedCategories =
                          state is InstrestSelectionUpdated
                          ? state.selectedCategories
                          : <String>[];

                      return Wrap(
                        spacing: 23.w,
                        runSpacing: 14.h,
                        children: List.generate(electronicIcons.length, (
                          index,
                        ) {
                          final isSelected = selectedCategories.contains(
                            electronicNames[index],
                          );

                          return GestureDetector(
                            onTap: () {
                              context.read<InstrestBloc>().add(
                                ChooseInstrestEvent(
                                  category: electronicNames[index],
                                ),
                              );
                            },
                            child: Container(
                              constraints: BoxConstraints(
                                minWidth: 111.w,
                                minHeight: 42.h,
                              ),
                              padding: EdgeInsets.symmetric(
                                horizontal: 14.w,
                                vertical: 6.h,
                              ),
                              decoration: BoxDecoration(
                                color: isSelected
                                    ? Colours.primary.withOpacity(0.15)
                                    : Colors.white,
                                borderRadius: BorderRadius.circular(10.r),
                                border: Border.all(
                                  color: isSelected
                                      ? Colours.primary
                                      : Colours.blue7BD3FC.withOpacity(0.25),
                                ),
                              ),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Icon(
                                    electronicIcons[index],
                                    size: 20.sp,
                                    color: isSelected
                                        ? Colours.primary
                                        : Colours.black6C6C6A,
                                  ),
                                  8.widthBox,
                                  Text(
                                    electronicNames[index],
                                    style: TextStyle(
                                      color: isSelected
                                          ? Colours.primary
                                          : Colours.black424242,
                                      fontSize: 14.sp,
                                      fontFamily: Fonts.sRegular,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        }),
                      );
                    },
                  ),
                  25.heightBox,
                  Text(
                    "Home Appliances",
                    style: TextStyle(
                      color: Colours.black616161,
                      fontSize: 18.sp,
                      fontFamily: Fonts.sSemiBold,
                    ),
                  ),
                  25.heightBox,
                  BlocBuilder<InstrestBloc, InstrestState>(
                    builder: (context, state) {
                      final selectedCategories =
                          state is InstrestSelectionUpdated
                          ? state.selectedCategories
                          : <String>[];

                      return Wrap(
                        spacing: 23.w,
                        runSpacing: 14.h,
                        children: List.generate(homeApplianceIcons.length, (
                          index,
                        ) {
                          final isSelected = selectedCategories.contains(
                            homeApplianceNames[index],
                          );

                          return GestureDetector(
                            onTap: () {
                              context.read<InstrestBloc>().add(
                                ChooseInstrestEvent(
                                  category: homeApplianceNames[index],
                                ),
                              );
                            },
                            child: Container(
                              constraints: BoxConstraints(
                                minWidth: 111.w,
                                minHeight: 42.h,
                              ),
                              padding: EdgeInsets.symmetric(
                                horizontal: 14.w,
                                vertical: 6.h,
                              ),
                              decoration: BoxDecoration(
                                color: isSelected
                                    ? Colours.primary.withOpacity(0.15)
                                    : Colors.white,
                                borderRadius: BorderRadius.circular(10.r),
                                border: Border.all(
                                  color: isSelected
                                      ? Colours.primary
                                      : Colours.blue7BD3FC.withOpacity(0.25),
                                ),
                              ),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Icon(
                                    homeApplianceIcons[index],
                                    size: 20.sp,
                                    color: isSelected
                                        ? Colours.primary
                                        : Colours.black6C6C6A,
                                  ),
                                  8.widthBox,
                                  Text(
                                    homeApplianceNames[index],
                                    style: TextStyle(
                                      color: isSelected
                                          ? Colours.primary
                                          : Colours.black424242,
                                      fontSize: 14.sp,
                                      fontFamily: Fonts.sRegular,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        }),
                      );
                    },
                  ),
                  25.heightBox,
                  Text(
                    "Toys and Games ",
                    style: TextStyle(
                      color: Colours.black616161,
                      fontSize: 18.sp,
                      fontFamily: Fonts.sSemiBold,
                    ),
                  ),
                  25.heightBox,
                  BlocBuilder<InstrestBloc, InstrestState>(
                    builder: (context, state) {
                      final selectedCategories =
                          state is InstrestSelectionUpdated
                          ? state.selectedCategories
                          : <String>[];

                      return Wrap(
                        spacing: 23.w,
                        runSpacing: 14.h,
                        children: List.generate(gamesAndToysNames.length, (
                          index,
                        ) {
                          final isSelected = selectedCategories.contains(
                            gamesAndToysNames[index],
                          );

                          return GestureDetector(
                            onTap: () {
                              context.read<InstrestBloc>().add(
                                ChooseInstrestEvent(
                                  category: gamesAndToysNames[index],
                                ),
                              );
                            },
                            child: Container(
                              constraints: BoxConstraints(
                                minWidth: 111.w,
                                minHeight: 42.h,
                              ),
                              padding: EdgeInsets.symmetric(
                                horizontal: 14.w,
                                vertical: 6.h,
                              ),
                              decoration: BoxDecoration(
                                color: isSelected
                                    ? Colours.primary.withOpacity(0.15)
                                    : Colors.white,
                                borderRadius: BorderRadius.circular(10.r),
                                border: Border.all(
                                  color: isSelected
                                      ? Colours.primary
                                      : Colours.blue7BD3FC.withOpacity(0.25),
                                ),
                              ),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Icon(
                                    gamesAndToysIcons[index],
                                    size: 20.sp,
                                    color: isSelected
                                        ? Colours.primary
                                        : Colours.black6C6C6A,
                                  ),
                                  8.widthBox,
                                  Text(
                                    gamesAndToysNames[index],
                                    style: TextStyle(
                                      color: isSelected
                                          ? Colours.primary
                                          : Colours.black424242,
                                      fontSize: 14.sp,
                                      fontFamily: Fonts.sRegular,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        }),
                      );
                    },
                  ),
                  100.heightBox,
                ],
              ),
            ),
          ),
          Positioned(
            // bottom: 20.h,
            top: 850.h,
            left: 24.w,
            right: 24.w,
            child: Row(
              children: [
                SizedBox(
                  height: 58.h,
                  width: 176.w,
                  child: FilledButton(
                    style: ButtonStyle(
                      shape: WidgetStatePropertyAll(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadiusGeometry.circular(16.r),
                        ),
                      ),
                      backgroundColor: WidgetStatePropertyAll(Colours.primary),
                    ),
                    onPressed: () {
                      goRouter.goNamed(Routes.locationScreen.name);
                    },
                    child: Text(
                      "Save",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16.sp,
                        fontFamily: Fonts.sBold,
                      ),
                    ),
                  ),
                ),
                Spacer(),
                SizedBox(
                  height: 58.h,
                  width: 176.w,
                  child: FilledButton(
                    style: ButtonStyle(
                      shape: WidgetStatePropertyAll(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadiusGeometry.circular(16.r),
                        ),
                      ),
                      backgroundColor: WidgetStatePropertyAll(Colors.white),
                    ),
                    onPressed: () {},
                    child: Text(
                      "Skip",
                      style: TextStyle(
                        color: Colours.primary,
                        fontSize: 16.sp,
                        fontFamily: Fonts.sBold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

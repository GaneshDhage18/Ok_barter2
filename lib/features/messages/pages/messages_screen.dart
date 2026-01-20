import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:okbarter2/core/const/colours.dart';
import 'package:okbarter2/core/const/fonts.dart';
import 'package:okbarter2/core/const/list.dart';
import 'package:okbarter2/core/const/urls.dart';
import 'package:okbarter2/core/extensions/sizedbox_extension.dart';
import 'package:okbarter2/core/routes/router.dart';
import 'package:okbarter2/features/messages/bloc/messages_bloc.dart';
import 'package:okbarter2/features/messages/components/custom_app_bar.dart';


class MessagesScreen extends StatelessWidget {
  const MessagesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // final bloc = context.read<MessagesBloc>();
    return CustomAppBar(
      title: 'Trades',
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            24.heightBox,
            Row(
              children: List.generate(filtersList.length, (index) {
                return BlocBuilder<MessagesBloc, MessagesState>(
                  buildWhen: (prev, curr) =>
                      curr is SelectedCategorySuccessState ||
                      curr is MessagesInitial,
                  builder: (context, state) {
                    final selectedIndex = state is SelectedCategorySuccessState
                        ? state.selctedIndex
                        : 0;

                    final isSelected = selectedIndex == index;

                    return GestureDetector(
                      onTap: () {
                        context.read<MessagesBloc>().add(
                          SelectedCategoryEvent(index: index),
                        );
                      },
                      child: Container(
                        margin: EdgeInsets.only(right: 12.w),
                        padding: EdgeInsets.symmetric(
                          horizontal: 20.w,
                          vertical: 8.h,
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50.r),
                          border: Border.all(color: Colours.primary),
                          color: isSelected ? Colours.primary : Colours.white,
                        ),
                        child: Text(
                          filtersList[index],
                          style: TextStyle(
                            fontFamily: Fonts.sMedium,
                            fontSize: 12.sp,
                            color: isSelected ? Colours.white : Colours.primary,
                          ),
                        ),
                      ),
                    );
                  },
                );
              }),
            ),

            Expanded(
              child: ListView.builder(
                itemCount: 5,
                padding: EdgeInsets.only(top: 24.h),
                itemBuilder: (context, index) => Column(
                  children: [
                    GestureDetector(
                      onTap: () {
                        goRouter.pushNamed(Routes.chatScreen.name);
                      },
                      child: TradesCard(),
                    ),
                    8.heightBox,
                    Divider(color: Colours.grey100.withOpacity(0.13)),
                    16.heightBox,
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

class TradesCard extends StatelessWidget {
  const TradesCard({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: CachedNetworkImage(
              imageUrl:
                  'https://i.pinimg.com/736x/82/4d/ae/824dae5a6f833dafc42e996e8fd34596.jpg',
              scale: 14,
            ),
          ),
          16.widthBox,
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      "Macbook M4 air",
                      style: TextStyle(
                        fontFamily: Fonts.sBold,
                        fontSize: 20.sp,
                        color: Colours.primary,
                      ),
                    ),
                    12.widthBox,
                    SvgPicture.asset(
                      Assets.icUpArrow,
                      height: 20.w,
                      width: 20.w,
                    ),
                  ],
                ),
                Text.rich(
                  TextSpan(
                    text: 'With ',
                    style: TextStyle(
                      fontFamily: Fonts.sMedium,
                      fontSize: 12.sp,
                      color: Colours.grey757575,
                    ),
                    children: [
                      TextSpan(
                        text: 'IPhone 17 pro Max',
                        style: TextStyle(
                          fontFamily: Fonts.sMedium,
                          fontSize: 14.sp,
                          color: Colours.primary,
                        ),
                      ),
                    ],
                  ),
                ),
                8.heightBox,
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        "I'm interested in bartering for your product",
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontSize: 12.sp,
                          color: Colours.grey757575,
                        ),
                      ),
                    ),
                    8.widthBox,
                    Text(
                      "05/06/1800",
                      style: TextStyle(
                        fontSize: 12.sp,
                        color: Colours.grey757575,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

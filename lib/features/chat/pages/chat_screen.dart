import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:okbarter2/core/const/colours.dart';
import 'package:okbarter2/core/const/fonts.dart';
import 'package:okbarter2/core/const/list.dart';
import 'package:okbarter2/core/const/urls.dart';
import 'package:okbarter2/core/extensions/sizedbox_extension.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colours.white,
      appBar: AppBar(
        backgroundColor: Colours.white,
        leading: BackButton(),
        titleSpacing: 0, // important
        title: Row(
          children: [
            CircleAvatar(
              radius: 20,
              backgroundColor: Colours.primary,
              child: Text(
                'G',
                style: TextStyle(
                  fontSize: 20,
                  fontFamily: Fonts.sMedium,
                  color: Colours.white,
                ),
              ),
            ),
            SizedBox(width: 12),
            Text(
              'Ganesh Dhage',
              style: TextStyle(fontSize: 16, fontFamily: Fonts.sMedium),
            ),
          ],
        ),
      ),

      body: Column(
        children: [
          // TOP TRADE BAR
          1.heightBox,
          Container(
            height: 78.h,
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            decoration: BoxDecoration(
              color: Colours.white,
              boxShadow: [
                BoxShadow(
                  color: Colours.grey400.withOpacity(0.3),
                  blurRadius: 20,
                ),
              ],
            ),
            child: Row(
              children: [
                Expanded(
                  child: Row(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(8.r),
                        child: CachedNetworkImage(
                          imageUrl:
                              'https://i.pinimg.com/736x/28/81/fb/2881fb38c059393922bf2b720726d93f.jpg',
                          width: 48.w,
                          height: 48.w,
                          fit: BoxFit.cover,
                        ),
                      ),
                      8.widthBox,
                      Expanded(
                        child: Text(
                          'IPhone 17 pro Max',
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontFamily: Fonts.sMedium,
                            fontSize: 14.sp,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SvgPicture.asset(Assets.icTradeIcon, width: 24.w, height: 24.w),
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Expanded(
                        child: Text(
                          'Macbook M4 air',
                          maxLines: 2,
                          textAlign: TextAlign.right,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontFamily: Fonts.sMedium,
                            fontSize: 14.sp,
                          ),
                        ),
                      ),
                      8.widthBox,
                      ClipRRect(
                        borderRadius: BorderRadius.circular(8.r),
                        child: CachedNetworkImage(
                          imageUrl:
                              'https://i.pinimg.com/736x/82/4d/ae/824dae5a6f833dafc42e996e8fd34596.jpg',
                          width: 48.w,
                          height: 48.w,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),

          // CHAT LIST (THIS TAKES ALL REMAINING SPACE)
          Expanded(
            child: ListView.builder(
              reverse: true,
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
              itemCount: dummyChat.length,
              itemBuilder: (context, index) {
                final item = dummyChat[dummyChat.length - 1 - index];

                return ChatTile.ChatTile(
                  text: item["text"],
                  isMe: item["isMe"],
                );
              },
            ),
          ),

          // INPUT BAR
          Padding(
            padding: EdgeInsets.fromLTRB(16.w, 8.h, 16.w, 24.h),
            child: Container(
              padding: EdgeInsets.only(left: 16.w, top: 4, bottom: 4),
              decoration: BoxDecoration(
                color: Colours.grey100,
                borderRadius: BorderRadius.circular(30.r),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      maxLines: null,
                      decoration: InputDecoration(
                        hintText: 'Write your message',
                        border: InputBorder.none,
                        isCollapsed: true,
                        hintStyle: TextStyle(fontSize: 14.sp),
                      ),
                    ),
                  ),
                  Transform.rotate(
                    angle: -0.92,
                    child: Container(
                      height: 44.w,
                      width: 44.w,
                      decoration: BoxDecoration(
                        color: Colours.primary,
                        shape: BoxShape.circle,
                      ),
                      child: Icon(
                        Icons.send_outlined,
                        color: Colors.white,
                        size: 24.w,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ChatTile extends StatelessWidget {
  final String text;
  final bool isMe;

  const ChatTile.ChatTile({super.key, required this.text, required this.isMe});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: isMe ? Alignment.centerRight : Alignment.centerLeft,
      child: ConstrainedBox(
        constraints: BoxConstraints(
          maxWidth: MediaQuery.of(context).size.width * 0.72,
        ),
        child: Container(
          margin: EdgeInsets.only(
            bottom: 12.h,
            left: isMe ? 48.w : 0,
            right: isMe ? 0 : 48.w,
          ),
          padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
          decoration: BoxDecoration(
            color: isMe ? Colours.primary : const Color(0xffDC6B91),
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(16.r),
              topRight: Radius.circular(16.r),
              bottomLeft: isMe ? Radius.circular(16.r) : Radius.circular(4.r),
              bottomRight: isMe ? Radius.circular(4.r) : Radius.circular(16.r),
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                text,
                style: TextStyle(color: Colors.white, fontSize: 14.sp),
              ),
              4.heightBox,
              Text(
                "12:49",
                style: TextStyle(color: Colors.white70, fontSize: 10.sp),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

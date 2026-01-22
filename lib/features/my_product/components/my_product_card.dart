import 'package:cached_network_image/cached_network_image.dart';
import 'package:okbarter2/core/extensions/app_imports.dart';

class MyProductsCard extends StatelessWidget {
  const MyProductsCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100.h,

      decoration: BoxDecoration(
        border: Border.all(color: Colours.grey400.withOpacity(0.4)),
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 12.w),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(12.r),
              child: CachedNetworkImage(
                width: 68.w,
                height: 70.h,
                fit: BoxFit.cover,
                imageUrl:
                    'https://i.pinimg.com/736x/28/81/fb/2881fb38c059393922bf2b720726d93f.jpg',
              ),
            ),

            12.widthBox, // <-- THIS was missing
            // DETAILS
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Iphone 17 Pro Max',
                    style: TextStyle(
                      fontSize: 14.sp,
                      fontFamily: Fonts.sSemiBold,
                      color: Colours.darkprimary,
                    ),
                  ),
                  4.heightBox,
                  Text(
                    '₹ 1,50,000',
                    style: TextStyle(
                      fontSize: 14.sp,
                      fontFamily: Fonts.sMedium,
                    ),
                  ),
                  4.heightBox,
                  Text(
                    'Views: 10',
                    style: TextStyle(
                      fontSize: 12.sp,
                      fontFamily: Fonts.sRegular,
                      color: Colours.textGrey,
                    ),
                  ),
                ],
              ),
            ),

            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Icon(Icons.more_vert),
                Padding(
                  padding: EdgeInsets.only(right: 24.w),
                  child: Text(
                    'Live',
                    style: TextStyle(
                      fontSize: 14.sp,
                      fontFamily: Fonts.sMedium,
                      color: Colours.green178777,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

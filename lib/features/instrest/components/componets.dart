// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:ok_barter/core/const/colours.dart';
// import 'package:ok_barter/core/const/fonts.dart';
// import 'package:ok_barter/core/extensions/sizedbox_extension.dart';
// import 'package:ok_barter/fetures/instrest/bloc/instrest_bloc.dart';

// Wrap chooseInterest({
//   required List<IconData> icon,
//   required List<String> title,
// }) {
//   final int itemCount = icon.length;

//   return Wrap(
//     spacing: 23.w,
//     runSpacing: 14.h,
//     children: List.generate(
//       itemCount,
//       (index) => BlocBuilder<InstrestBloc, InstrestState>(
//         builder: (context, state) {
//           final bloc = context.read<InstrestBloc>();
//           return GestureDetector(
//             onTap: () {},
//             child: Container(
//               constraints: BoxConstraints(minWidth: 111.w, minHeight: 42.h),
//               padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 6.h),
//               decoration: BoxDecoration(
//                 color: Colors.white,
//                 borderRadius: BorderRadius.circular(10.r),
//                 border: Border.all(color: Colours.blue7BD3FC.withOpacity(0.25)),
//               ),
//               child: Row(
//                 mainAxisSize: MainAxisSize.min,
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   Icon(icon[index], size: 20.sp, color: Colours.black6C6C6A),
//                   8.widthBox,
//                   Text(
//                     title[index],
//                     style: TextStyle(
//                       color: Colours.black424242,
//                       fontSize: 14.sp,
//                       fontFamily: Fonts.sRegular,
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           );
//         },
//       ),
//     ),
//   );
// }

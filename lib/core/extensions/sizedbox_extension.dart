
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

extension SizedboxExtension on num {
  SizedBox get heightBox => SizedBox(height: toDouble().h);
  SizedBox get widthBox => SizedBox(width: toDouble().w);

  // get widthBox => SizedBox(width: toDouble());
  // get heightBox => SizedBox(height: toDouble());
  // get radian => this * pi / 180;

  // get screenHeight => (this / 956).sh;
  // get screenWidth => (this / 440).sw;

  // get shBox => SizedBox(height: screenHeight);
  // get swBox => SizedBox(width: screenWidth);
}

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:okbarter2/core/extensions/app_imports.dart';
import 'package:okbarter2/features/home/components/components.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w),
          child: Column(
            children: [
              20.heightBox,
              customTextFormField(hintText: "Search"),
            ],
          ),
        ),
      ),
    );
  }
}

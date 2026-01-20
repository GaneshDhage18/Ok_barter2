import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ok_barter/core/const/colours.dart';
import 'package:ok_barter/core/extensions/sizedbox_extension.dart';

class ProductImageSlider extends StatefulWidget {
  final List<String> productImages;

  const ProductImageSlider({super.key, required this.productImages});

  @override
  State<ProductImageSlider> createState() => _ProductImageSliderState();
}

class _ProductImageSliderState extends State<ProductImageSlider> {
  final PageController _pageController = PageController();
  int _currentIndex = 0;

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 250.h,
      child: Column(
        children: [
          /// 🔹 IMAGE SLIDER
          Expanded(
            child: PageView.builder(
              controller: _pageController,
              itemCount: widget.productImages.length,
              onPageChanged: (index) {
                setState(() {
                  _currentIndex = index;
                });
              },
              itemBuilder: (context, index) {
                return Image.network(
                  widget.productImages[index],

                  loadingBuilder: (context, child, loadingProgress) {
                    if (loadingProgress == null) return child;
                    return const Center(child: CircularProgressIndicator());
                  },
                  errorBuilder: (context, error, stackTrace) {
                    return const Icon(Icons.broken_image);
                  },
                );
              },
            ),
          ),

          10.heightBox,

          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(
              widget.productImages.length,
              (index) => AnimatedContainer(
                duration: const Duration(milliseconds: 200),
                margin: EdgeInsets.symmetric(horizontal: 2.w),
                height: 6.h,
                width: _currentIndex == index ? 14.w : 6.w,
                decoration: BoxDecoration(
                  color: _currentIndex == index
                      ? Colours.primary
                      : Colours.primary.withOpacity(0.3),
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

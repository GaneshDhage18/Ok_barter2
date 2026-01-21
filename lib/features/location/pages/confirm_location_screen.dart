import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:okbarter2/core/const/colours.dart';
import 'package:okbarter2/core/const/fonts.dart';
import 'package:okbarter2/core/const/urls.dart';
import 'package:okbarter2/core/extensions/sizedbox_extension.dart';
import 'package:okbarter2/core/routes/router.dart';
import 'package:okbarter2/features/location/components/custom_text_validator.dart';
import 'package:okbarter2/features/location/components/custom_textfield.dart';
import 'package:okbarter2/features/location/components/filled_button.dart';

class ConfirmLocationScreen extends StatefulWidget {
  const ConfirmLocationScreen({super.key});

  @override
  State<ConfirmLocationScreen> createState() => _ConfirmLocationScreenState();
}

class _ConfirmLocationScreenState extends State<ConfirmLocationScreen> {
  final LatLng _center = const LatLng(19.0760, 72.8777);

  final Completer<GoogleMapController> _mapController =
      Completer<GoogleMapController>();

  final TextEditingController flatField = TextEditingController();
  final TextEditingController nearbyLandField = TextEditingController();
  final TextEditingController cityField = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    flatField.dispose();
    nearbyLandField.dispose();
    cityField.dispose();
    super.dispose();
  }

  void _openBottomSheet() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16.r)),
      ),
      builder: (context) {
        return Padding(
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom,
            left: 24.w,
            right: 24.w,
            top: 16.h,
          ),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Enter complete address',
                      style: TextStyle(
                        fontSize: 20.sp,
                        fontFamily: Fonts.sRegular,
                      ),
                    ),
                    IconButton(
                      onPressed: () => Navigator.pop(context),
                      icon: const Icon(Icons.close),
                    ),
                  ],
                ),
                24.heightBox,

                customeTextField(
                  hintText: "Flat / house no / building",
                  controller: flatField,
                  validator: (value) => customTextValidator(value),
                ),
                16.heightBox,

                customeTextField(
                  hintText: "Nearby landmark",
                  controller: nearbyLandField,
                  validator: (value) => customTextValidator(value),
                ),
                16.heightBox,

                customeTextField(
                  hintText: "City",
                  controller: cityField,
                  validator: (value) => customTextValidator(value),
                ),
                24.heightBox,

                SizedBox(
                  width: double.infinity,
                  height: 56.h,
                  child: filledButton(
                    title: 'Save address',
                    onPressed: () {
                      goRouter.goNamed(Routes.homeScreen.name);
                      if (_formKey.currentState!.validate()) {
                        Navigator.pop(context);
                      }
                    },
                  ),
                ),
                16.heightBox,
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const BackButton(),
        title: Text(
          'Confirm location',
          style: TextStyle(fontSize: 16.sp, fontFamily: Fonts.sRegular),
        ),
      ),
      body: Stack(
        children: [
          /// Google Map
          GoogleMap(
            initialCameraPosition: CameraPosition(target: _center, zoom: 14),
            markers: {
              Marker(markerId: const MarkerId('center'), position: _center),
            },
            circles: {
              Circle(
                circleId: const CircleId('radius'),
                center: _center,
                radius: 600,
                fillColor: Colours.green178777.withOpacity(0.15),
                strokeColor: Colors.transparent,
              ),
            },
            myLocationEnabled: false, // enable only after permission
            myLocationButtonEnabled: false,
            onMapCreated: (controller) {
              _mapController.complete(controller);
            },
          ),

          /// Search bar + current location
          Column(
            children: [
              Padding(
                padding: EdgeInsets.all(24.w),
                child: TextField(
                  decoration: InputDecoration(
                    hintText: 'Search location manually',
                    prefixIcon: Transform.scale(
                      scale: 0.4,
                      child: SvgPicture.asset(Assets.icSearchIcon),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12.r),
                    ),
                  ),
                ),
              ),
              const Spacer(),
              Container(
                margin: EdgeInsets.only(bottom: 260.h),
                padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
                decoration: BoxDecoration(
                  color: Colours.white,
                  borderRadius: BorderRadius.circular(6.r),
                  border: Border.all(color: Colours.redEA1E63.withOpacity(0.3)),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SvgPicture.asset(Assets.icCurrentLocation),
                    8.widthBox,
                    Text(
                      'Use current location',
                      style: TextStyle(fontSize: 12.sp),
                    ),
                  ],
                ),
              ),
            ],
          ),

          /// Bottom sheet preview
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: Container(
              padding: EdgeInsets.all(24.w),
              decoration: BoxDecoration(
                color: Colours.white,
                borderRadius: BorderRadius.vertical(top: Radius.circular(16.r)),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 12,
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Select a saved address',
                    style: TextStyle(
                      fontSize: 16.sp,
                      fontFamily: Fonts.sRegular,
                    ),
                  ),
                  24.heightBox,
                  SizedBox(
                    width: double.infinity,
                    height: 56.h,
                    child: filledButton(
                      title: 'Add more address details',
                      onPressed: _openBottomSheet,
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

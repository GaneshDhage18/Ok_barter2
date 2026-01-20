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
  late GoogleMapController _mapController;

  @override
  void initState() {
    super.initState();
  }

  Set<Marker> get _markers => {
    Marker(markerId: const MarkerId('center'), position: _center),
  };

  TextEditingController flatField = TextEditingController();
  TextEditingController nearbyLandField = TextEditingController();
  TextEditingController cityField = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey();

  openBottomSheet() {
    showModalBottomSheet(
      context: context,
      builder: (_) {
        return Container(
          height: 398.h,
          padding: EdgeInsets.only(
            top: 12.h,
            left: 24.w,
            right: 22.w,
            // bottom: 22.h,
          ),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16.r),
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
                        color: Colours.black,
                        fontSize: 20.sp,
                        fontFamily: Fonts.sRegular,
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        goRouter.pop();
                      },
                      icon: Icon(
                        Icons.close,
                        color: Colours.black212121,
                        size: 24.sp,
                      ),
                    ),
                  ],
                ),
                29.heightBox,

                customeTextField(
                  hintText: "Flat / house no / building",
                  controller: flatField,
                  validator: (value) => customTextValidator(value),
                ),
                15.heightBox,

                customeTextField(
                  hintText: "Nearby landmark",
                  controller: nearbyLandField,
                  validator: (value) => customTextValidator(value),
                ),
                15.heightBox,

                customeTextField(
                  hintText: "Panchavti, Nashik",
                  controller: cityField,
                  validator: (value) => customTextValidator(value),
                ),

                30.heightBox,
                SizedBox(
                  width: double.infinity,
                  height: 58.h,
                  child: filledButton(
                    onPressed: () {
                      goRouter.goNamed(Routes.messagesScreen.name);
                      if (_formKey.currentState!.validate()) {}
                    },
                    title: 'Save address',
                  ),
                ),
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
        title: Padding(
          padding: EdgeInsets.only(left: 4.w),
          child: Row(
            children: [
              const Icon(Icons.arrow_back_ios_new),
              SizedBox(width: 16.w),
              Text(
                'Confirm location',
                style: TextStyle(fontSize: 16.sp, fontFamily: Fonts.sRegular),
              ),
            ],
          ),
        ),
      ),
      body: Stack(
        children: [
          GoogleMap(
            initialCameraPosition: CameraPosition(target: _center, zoom: 14),
            markers: {
              Marker(
                markerId: const MarkerId('center_marker'),
                position: _center,
              ),
            },
            circles: {
              Circle(
                circleId: const CircleId('radius_circle'),
                center: _center,
                radius: 600, // meters
                fillColor: Colours.green178777.withOpacity(0.15),
                strokeColor: Colors.transparent,
                strokeWidth: 0,
              ),
            },
            myLocationEnabled: true,
            myLocationButtonEnabled: true,
            onMapCreated: (controller) {
              _mapController = controller;
            },
          ),

          Column(
            children: [
              Padding(
                padding: EdgeInsets.only(left: 24.w, right: 24.w, top: 16.h),
                child: SizedBox(
                  height: 48.h,
                  child: TextField(
                    onTap: () {},
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide(
                          color: Colours.green178777.withOpacity(0.24),
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide(
                          color: Colours.green178777.withOpacity(0.24),
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide(
                          color: Colours.green178777.withOpacity(0.24),
                          width: 1.5,
                        ),
                      ),
                      prefixIcon: Transform.scale(
                        scale: 0.4,
                        child: SvgPicture.asset(Assets.icSearchIcon),
                      ),
                      hintText: 'Search Location manually',
                      hintStyle: TextStyle(
                        color: Colours.grey900,
                        fontSize: 14,
                        fontFamily: Fonts.sSemiBold,
                      ),
                    ),
                  ),
                ),
              ),
              472.heightBox,
              Container(
                width: 176.w,
                height: 34.h,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colours.redEA1E63.withOpacity(0.38),
                  ),
                  borderRadius: BorderRadius.circular(6.r),
                  color: Colours.white,
                ),
                child: Padding(
                  padding: EdgeInsets.only(
                    top: 8.h,
                    bottom: 8.h,
                    right: 14.w,
                    left: 12.w,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SvgPicture.asset(Assets.icCurrentLocation),
                      Text(
                        'Use current location',
                        style: TextStyle(
                          fontSize: 12,
                          fontFamily: Fonts.sRegular,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),

          Positioned(
            left: 0.w,
            right: 0.w,
            bottom: 0.h,
            child: Container(
              height: 230,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16.r),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 12,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: Padding(
                padding: EdgeInsets.only(left: 24.w, right: 16.w, top: 12.h),
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
                    28.heightBox,
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Icon(Icons.location_pin),
                        16.widthBox,
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Panchvati  ',
                                style: TextStyle(
                                  fontSize: 16.sp,
                                  fontFamily: Fonts.sRegular,
                                ),
                              ),
                              Text(
                                'Nashik',
                                style: TextStyle(
                                  fontSize: 10.sp,
                                  fontFamily: Fonts.sRegular,
                                ),
                              ),
                            ],
                          ),
                        ),
                        TextButton(
                          onPressed: () {},
                          child: Text(
                            'CHANGE',
                            style: TextStyle(
                              fontSize: 12.sp,
                              fontFamily: Fonts.sRegular,
                              color: Colours.redEA1E63,
                            ),
                          ),
                        ),
                      ],
                    ),
                    24.heightBox,
                    SizedBox(
                      width: double.infinity,
                      height: 58.h,
                      child: filledButton(
                        onPressed: () {
                          openBottomSheet();
                        },
                        title: 'Add more address details',
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

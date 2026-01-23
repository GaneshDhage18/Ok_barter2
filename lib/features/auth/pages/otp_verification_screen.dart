import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:okbarter2/core/const/colours.dart';
import 'package:okbarter2/core/const/fonts.dart';
import 'package:okbarter2/core/extensions/sizedbox_extension.dart';
import 'package:okbarter2/core/routes/router.dart';
import 'package:okbarter2/features/auth/bloc/auth_bloc.dart';
import 'package:okbarter2/features/auth/componets/email_mask.dart';
import 'package:okbarter2/features/auth/componets/pin_theme.dart';
import 'package:pinput/pinput.dart';

class OtpVerificationScreen extends StatefulWidget {
  const OtpVerificationScreen({super.key, required this.phoneNumber});

  final String phoneNumber;

  @override
  State<OtpVerificationScreen> createState() => _OtpVerificationScreenState();
}

class _OtpVerificationScreenState extends State<OtpVerificationScreen> {
  final TextEditingController pinField = TextEditingController();
  late AuthBloc _authBloc;
  final formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    _authBloc = context.read<AuthBloc>();
    _authBloc.add(StartOtpTimer());
  }

  @override
  Widget build(BuildContext context) {
    final maskedEmail = maskEmail(widget.phoneNumber);

    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is VerifyOtpSuccessState) {
          goRouter.goNamed(Routes.instrestScreen.name);
        }

        if (state is VerifyOtpErrorState) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(state.error), backgroundColor: Colors.red),
          );
        }
      },
      child: Scaffold(
        body: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: SafeArea(
            child: Padding(
              padding: EdgeInsets.all(24.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  20.heightBox,

                  /// 🔙 BACK
                  IconButton(
                    onPressed: () => goRouter.pop(),
                    icon: const Icon(Icons.arrow_back),
                  ),

                  22.heightBox,

                  /// 🔐 TITLE
                  Text(
                    "OTP Verification",
                    style: TextStyle(
                      fontSize: 28.sp,
                      fontFamily: Fonts.sBold,
                      color: const Color(0xff424242),
                    ),
                  ),

                  16.heightBox,

                  /// 📩 DESCRIPTION
                  Text(
                    "Please enter the verification code we just sent to your email address",
                    style: TextStyle(
                      fontSize: 16.sp,
                      fontFamily: Fonts.sMedium,
                      color: Colours.textGrey,
                    ),
                  ),

                  24.heightBox,

                  /// 📧 EMAIL
                  Text(
                    "Code has been sent to:",
                    style: TextStyle(
                      fontSize: 14.sp,
                      fontFamily: Fonts.sMedium,
                      color: Colours.textGrey,
                    ),
                  ),
                  4.heightBox,
                  Text(
                    maskedEmail,
                    style: TextStyle(
                      fontSize: 14.sp,
                      fontFamily: Fonts.sBold,
                      color: Colours.textGrey,
                    ),
                  ),

                  32.heightBox,

                  /// 🔢 OTP INPUT
                  Form(
                    key: formKey,
                    child: Center(
                      child: Pinput(
                        controller: pinField,
                        length: 4,
                        autofocus: true,
                        keyboardType: TextInputType.number,
                        showCursor: true,
                        defaultPinTheme: defaultPinTheme(),
                        focusedPinTheme: focusedPinTheme(),
                        submittedPinTheme: submittedPinTheme(),
                        errorPinTheme: errorPinTheme(),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "OTP is required";
                          }
                          if (value.length != 4) {
                            return "Enter 4 digit OTP";
                          }
                          return null;
                        },
                        onCompleted: (pin) {
                          if (formKey.currentState!.validate()) {
                            _authBloc.add(
                              VerifyOtpEvent(
                                number: widget.phoneNumber,
                                otp: pin,
                                // deviceId: '',
                                // deviceType: '',
                              ),
                            );
                          }
                        },
                      ),
                    ),
                  ),

                  28.heightBox,

                  /// 🔁 RESEND OTP
                  BlocConsumer<AuthBloc, AuthState>(
                    listener: (context, state) {
                      if (state is OtpResentSuccess) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text("OTP resent successfully"),
                            backgroundColor: Colors.green,
                          ),
                        );
                      }
                    },
                    builder: (context, state) {
                      if (state is OtpTimerRunning) {
                        return Text.rich(
                          TextSpan(
                            text: "Resend OTP in ",
                            style: TextStyle(
                              fontSize: 14.sp,
                              fontFamily: Fonts.sMedium,
                              color: Colours.textGrey,
                            ),
                            children: [
                              TextSpan(
                                text: "${state.secondsLeft}s",
                                style: TextStyle(
                                  fontSize: 14.sp,
                                  fontFamily: Fonts.sBold,
                                  color: Colours.primary,
                                ),
                              ),
                            ],
                          ),
                        );
                      }

                      return TextButton(
                        onPressed: () {
                          _authBloc.add(ResendOtpEvent());
                          _authBloc.add(
                            SendOtpEvent(
                              mobileNumber: widget.phoneNumber.toString(),
                            ),
                          );
                        },
                        child: Text(
                          "Resend OTP",
                          style: TextStyle(
                            decoration: TextDecoration.underline,
                            decorationColor: Colours.primary,
                            decorationThickness: 2,
                            fontSize: 15.sp,
                            fontFamily: Fonts.sBold,
                            color: Colours.primary,
                          ),
                        ),
                      );
                    },
                  ),

                  34.heightBox,

                  /// ✅ VERIFY BUTTON
                  SizedBox(
                    width: double.infinity,
                    height: 58.h,
                    child: FilledButton(
                      style: FilledButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16.r),
                        ),
                        backgroundColor: Colours.primary,
                      ),
                      onPressed: () {
                        if (formKey.currentState!.validate()) {
                          _authBloc.add(
                            VerifyOtpEvent(
                              number: widget.phoneNumber,
                              otp: pinField.text,
                            ),
                          );
                        }
                      },
                      child: Text(
                        "Verify",
                        style: TextStyle(
                          fontFamily: Fonts.sBold,
                          fontSize: 16.sp,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

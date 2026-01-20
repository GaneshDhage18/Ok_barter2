import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:okbarter2/core/const/colours.dart';
import 'package:okbarter2/core/const/fonts.dart';
import 'package:okbarter2/core/const/urls.dart';
import 'package:okbarter2/core/extensions/sizedbox_extension.dart';
import 'package:okbarter2/core/routes/router.dart';
import 'package:okbarter2/features/auth/bloc/auth_bloc.dart';
import 'package:okbarter2/features/auth/componets/custome_textfield.dart';
import 'package:okbarter2/features/auth/componets/validators.dart';

class SignInScreen extends StatelessWidget {
  final GlobalKey<FormState> formkey = GlobalKey();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: SingleChildScrollView(
            keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
            reverse: true,
            child: GestureDetector(
              onTap: () {
                FocusManager.instance.primaryFocus?.unfocus();
              },
              child: Form(
                key: formkey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    20.heightBox,

                    IconButton(
                      onPressed: () => Navigator.pop(context),
                      icon: const Icon(Icons.arrow_back),
                    ),

                    22.heightBox,

                    Text(
                      "Sign In",
                      style: TextStyle(
                        fontSize: 28.sp,
                        fontFamily: Fonts.sBold,
                        color: const Color(0xff424242),
                      ),
                    ),

                    22.heightBox,

                    Text(
                      "Welcome Back  👋",
                      style: TextStyle(
                        fontSize: 16.sp,
                        fontFamily: Fonts.sMedium,
                        color: Colours.textGrey,
                      ),
                    ),

                    12.heightBox,

                    Text(
                      "Please enter the details below",
                      style: TextStyle(
                        fontSize: 14.sp,
                        fontFamily: Fonts.sMedium,
                        color: Colours.textGrey,
                      ),
                    ),

                    39.heightBox,

                    /// NAME

                    /// EMAIL
                    CustomTextField(
                      validator: Validators.email,
                      controller: passwordController,
                      label: "Email Id",
                      hintText: "Enter your email",
                      keyboardType: TextInputType.emailAddress,
                      prefixIcon: Icon(
                        Icons.email,
                        color: Colours.primary,
                        size: 20.w,
                      ),
                    ),

                    16.heightBox,

                    /// PASSWORD (BLOC)
                    BlocBuilder<AuthBloc, AuthState>(
                      buildWhen: (previous, current) =>
                          current is PasswordVisibilytyState,
                      builder: (context, state) {
                        final isObsecure = state is PasswordVisibilytyState
                            ? state.obsecure
                            : true;

                        return CustomTextField(
                          validator: Validators.password,
                          controller: passwordController,
                          label: "Password",
                          hintText: "Enter your password",
                          isObscure: isObsecure, // ✅ YOU MISSED THIS
                          prefixIcon: Icon(
                            Icons.lock,
                            color: Colours.primary,
                            size: 20.w,
                          ),
                          suffixIcon: IconButton(
                            onPressed: () {
                              context.read<AuthBloc>().add(
                                TogglePasswordVisibiltyEvent(),
                              );
                            },
                            icon: Icon(
                              isObsecure
                                  ? Icons.visibility_off
                                  : Icons.visibility,
                              color: Colours.primary,
                              size: 20.w,
                            ),
                          ),
                        );
                      },
                    ),
                    34.heightBox,
                    SizedBox(
                      width: double.infinity,
                      height: 58.h,

                      child: FilledButton(
                        style: FilledButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadiusGeometry.circular(16.r),
                          ),

                          backgroundColor: Colours.primary,
                        ),
                        onPressed: () {
                          goRouter.goNamed(Routes.homeScreen.name);

                          if (formkey.currentState!.validate()) {
                            final email = emailController.text.trim();
                            // 👈 your next screen route
                          }
                        },
                        child: Text(
                          "Sign up",
                          style: TextStyle(
                            fontFamily: Fonts.sBold,
                            fontSize: 16.sp,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                    29.heightBox,

                    Row(
                      children: [
                        Expanded(
                          child: Divider(
                            color: Colours.appGrey.withOpacity(0.20),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 16.w),
                          child: Text(
                            "or",
                            style: TextStyle(
                              fontFamily: Fonts.sBold,
                              fontSize: 18.sp,
                              color: Colours.appGrey,
                            ),
                          ),
                        ),
                        Expanded(
                          child: Divider(
                            color: Colours.appGrey.withOpacity(0.20),
                          ),
                        ),
                      ],
                    ),
                    20.heightBox,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Already have an account?",
                          style: TextStyle(
                            fontFamily: Fonts.sRegular,
                            fontSize: 14.sp,
                            color: Color(0xff9E9E9E),
                          ),
                        ),
                        TextButton(
                          onPressed: () {
                            goRouter.goNamed(Routes.signUpScreen.name);
                          },
                          child: Text(
                            "Sign in",
                            style: TextStyle(
                              fontFamily: Fonts.sSemiBold,
                              fontSize: 14.sp,
                              color: Color(0xff476AB0),
                            ),
                          ),
                        ),
                      ],
                    ),
                    37.heightBox,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SvgPicture.asset(
                          Assets.googleLogo,
                          height: 24.w,
                          width: 24.w,
                        ),
                        45.widthBox,
                        SvgPicture.asset(
                          Assets.facebookLogo,
                          height: 24.w,
                          width: 24.w,
                        ),
                        45.widthBox,

                        SvgPicture.asset(
                          Assets.appleLogo,
                          height: 24.w,
                          width: 24.w,
                        ),
                      ],
                    ),
                    Padding(padding: EdgeInsetsGeometry.only(bottom: 50)),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

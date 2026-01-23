import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:okbarter2/core/const/urls.dart';
import 'package:okbarter2/core/routes/router.dart';
import 'package:okbarter2/features/auth/bloc/auth_bloc.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    context.read<AuthBloc>().add(HandleAppOpen());
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is NavigateToHomeState) {
          goRouter.goNamed(Routes.homeScreen.name);
        }
        if (state is NavigateToOnboardingState) {
          goRouter.goNamed(Routes.landingScreen.name);
        }

        if (state is NavigateToSignInState) {
          goRouter.goNamed(Routes.signInScreen.name);
        }
      },
      child: Scaffold(
        body: Center(
          child: SvgPicture.asset(Assets.logo, width: 160, height: 160),
        ),
      ),
    );
  }
}

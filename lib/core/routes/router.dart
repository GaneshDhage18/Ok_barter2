import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:okbarter2/features/Account/pages/Account_screen.dart';
import 'package:okbarter2/features/Account/pages/help_and_support_screen.dart';
import 'package:okbarter2/features/Account/pages/settings_screen.dart';
import 'package:okbarter2/features/Account/pages/wishlis_screen.dart';
import 'package:okbarter2/features/add_Product/bloc/add_Product_bloc.dart';
import 'package:okbarter2/features/add_Product/pages/add_Product_screen.dart';
import 'package:okbarter2/features/add_Product/pages/addproduct_success_screen.dart';
import 'package:okbarter2/features/auth/pages/landing_screen.dart';
import 'package:okbarter2/features/auth/pages/otp_verification_screen.dart';
import 'package:okbarter2/features/auth/pages/sign_in_screen.dart';
import 'package:okbarter2/features/auth/pages/signup_screen.dart';
import 'package:okbarter2/features/auth/pages/splash_screen.dart';
import 'package:okbarter2/features/bottomNavigationBar/pages/bottomNavigationBar_screen.dart';

import 'package:okbarter2/features/chat/pages/chat_screen.dart';
import 'package:okbarter2/features/home/bloc/home_bloc.dart';
import 'package:okbarter2/features/home/pages/home_screen.dart';
import 'package:okbarter2/features/instrest/bloc/instrest_bloc.dart';
import 'package:okbarter2/features/instrest/pages/instrest_screen.dart';
import 'package:okbarter2/features/location/pages/confirm_location_screen.dart';
import 'package:okbarter2/features/location/pages/location_screen.dart';
import 'package:okbarter2/features/messages/pages/messages_screen.dart';
import 'package:okbarter2/features/my_product/pages/my_product_screen.dart';
import 'package:okbarter2/features/product_details/pages/product_details_screen.dart';
import 'package:okbarter2/features/search/pages/search_screen.dart';

final GlobalKey<NavigatorState> rootNavigator = GlobalKey();

enum Routes {
  splashScreen,
  locationScreen,
  confirmLocationScreen,
  messagesScreen,
  chatScreen,
  landingScreen,
  productDetailsScreen,
  signUpScreen,
  otpVerificationScreen,
  signInScreen,
  accountScreen,
  helpandsupportScreen,
  wishListScreen,
  settingsScreen,
  homeScreen,
  profileScreen,
  instrestScreen,
  productAddedSuccesfuly,
  addProduct,
  searchScreen,
  myproductScreen,
}

GoRouter goRouter = GoRouter(
  navigatorKey: rootNavigator,
  initialLocation: '/',
  routes: [
    GoRoute(
      path: "/",
      name: Routes.splashScreen.name,
      builder: (context, state) => SplashScreen(),
    ),
    GoRoute(
      path: "/locationScreen",
      name: Routes.locationScreen.name,
      builder: (context, state) => LocationScreen(),
    ),

    GoRoute(
      path: "/landingScreen",
      name: Routes.landingScreen.name,
      pageBuilder: (context, state) => CustomTransitionPage(
        key: state.pageKey,
        child: LandingScreen(),
        transitionsBuilder: rotationFadeTransition,
      ),
    ),
    GoRoute(
      path: "/SignupScreen",
      name: Routes.signUpScreen.name,
      pageBuilder: (context, state) => CustomTransitionPage(
        key: state.pageKey,
        child: SignupScreen(),
        transitionsBuilder: rotationFadeTransition,
      ),
      routes: [
        GoRoute(
          path: "signInScreen",
          name: Routes.signInScreen.name,
          pageBuilder: (context, state) => CustomTransitionPage(
            key: state.pageKey,
            child: SignInScreen(),
            transitionsBuilder: rotationFadeTransition,
          ),
        ),
      ],
    ),
    GoRoute(
      path: "/OtpVerificationScreen",
      name: Routes.otpVerificationScreen.name,
      pageBuilder: (context, state) {
        final email = state.extra as String;
        return CustomTransitionPage(
          key: state.pageKey,
          child: OtpVerificationScreen(phoneNumber: email),
          transitionsBuilder: _slideTransition,
        );
      },
    ),

    GoRoute(
      path: "/instrestScreen",
      name: Routes.instrestScreen.name,
      builder: (context, state) => BlocProvider(
        create: (context) => InstrestBloc(),
        child: InstrestScreen(),
      ),
    ),

    GoRoute(
      path: "/productaddedsuccess",
      name: Routes.productAddedSuccesfuly.name,
      builder: (context, state) => AddproductSuccessScreen(),
    ),
    GoRoute(
      path: "/addProduct",
      name: Routes.addProduct.name,
      builder: (context, state) => BlocProvider(
        create: (context) => AddProductBloc(),
        child: AddProductScreen(),
      ),
    ),

    ShellRoute(
      builder: (context, state, child) =>
          BottomNavigationBarScreen(child: child),
      routes: [
        GoRoute(
          path: "/homeScreen",
          name: Routes.homeScreen.name,
          builder: (context, state) => BlocProvider(
            create: (context) => HomeBloc(),
            child: HomeScreen(),
          ),
          routes: [
            GoRoute(
              path: "/productDetailsScreen",
              name: Routes.productDetailsScreen.name,
              builder: (context, state) => ProductDetailsScreen(),
            ),
            GoRoute(
              path: "/searchScreen",
              name: Routes.searchScreen.name,
              builder: (context, state) => SearchScreen(),
            ),
          ],
        ),
        GoRoute(
          path: "/messagesScreen",
          name: Routes.messagesScreen.name,
          builder: (context, state) => MessagesScreen(),
        ),
        GoRoute(
          path: "/myproductScreen",
          name: Routes.myproductScreen.name,
          builder: (context, state) => MyProductScreen(),
        ),
        GoRoute(
          path: "/AccountScreen",
          name: Routes.accountScreen.name,
          pageBuilder: (context, state) => CustomTransitionPage(
            key: state.pageKey,
            child: AccountScreen(),
            transitionsBuilder: rotationFadeTransition,
          ),
          routes: [
            GoRoute(
              path: "helpandsupportscreen",
              name: Routes.helpandsupportScreen.name,
              pageBuilder: (context, state) => CustomTransitionPage(
                key: state.pageKey,
                child: HelpAndSupportScreen(),
                transitionsBuilder: rotationFadeTransition,
              ),
            ),
            GoRoute(
              path: "WishListScreen",
              name: Routes.wishListScreen.name,
              pageBuilder: (context, state) => CustomTransitionPage(
                key: state.pageKey,
                child: WishlistScreen(),
                transitionsBuilder: rotationFadeTransition,
              ),
            ),
            GoRoute(
              path: "settingsScreen",
              name: Routes.settingsScreen.name,
              pageBuilder: (context, state) => CustomTransitionPage(
                key: state.pageKey,
                child: SettingsScreen(),
                transitionsBuilder: rotationFadeTransition,
              ),
            ),
          ],
        ),
      ],
    ),
    GoRoute(
      path: "/confirmLocationScreen",
      name: Routes.confirmLocationScreen.name,
      builder: (context, state) => ConfirmLocationScreen(),
    ),

    // GoRoute(
    //   path: "/confirmLocationScreen",
    //   name: Routes.confirmLocationScreen.name,
    //   builder: (context, state) => ConfirmLocationScreen(),
    // ),
    GoRoute(
      path: "/chatScreen",
      name: Routes.chatScreen.name,
      builder: (context, state) => ChatScreen(),
    ),
  ],
);

/// ================= FADE TRANSITION =================
Widget _fadeTransition(
  BuildContext context,
  Animation<double> animation,
  Animation<double> secondaryAnimation,
  Widget child,
) {
  return FadeTransition(opacity: animation, child: child);
}

/// ================= SLIDE TRANSITION =================
Widget _slideTransition(
  BuildContext context,
  Animation<double> animation,
  Animation<double> secondaryAnimation,
  Widget child,
) {
  final tween = Tween<Offset>(
    begin: const Offset(1, 0),
    end: Offset.zero,
  ).chain(CurveTween(curve: Curves.easeInOut));
  return SlideTransition(position: animation.drive(tween), child: child);
}

Widget rotationFadeTransition(
  BuildContext context,
  Animation<double> animation,
  Animation<double> secondaryAnimation,
  Widget child,
) {
  final rotate = Tween<double>(
    begin: 0.2,
    end: 0.0,
  ).animate(CurvedAnimation(parent: animation, curve: Curves.easeOut));
  final fade = Tween<double>(
    begin: 0.0,
    end: 1.0,
  ).animate(CurvedAnimation(parent: animation, curve: Curves.easeIn));

  return FadeTransition(
    opacity: fade,
    child: RotationTransition(turns: rotate, child: child),
  );
}

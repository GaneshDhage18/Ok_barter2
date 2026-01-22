import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:okbarter2/core/const/colours.dart';
import 'package:okbarter2/core/const/fonts.dart';
import 'package:okbarter2/core/routes/router.dart';

class AddproductSuccessScreen extends StatefulWidget {
  const AddproductSuccessScreen({super.key});

  @override
  State<AddproductSuccessScreen> createState() =>
      _AddproductSuccessScreenState();
}

class _AddproductSuccessScreenState extends State<AddproductSuccessScreen> {
  @override
  void initState() {
    super.initState();

    /// Auto navigate after animation
    Future.delayed(const Duration(seconds: 2), () {
      goRouter.goNamed(Routes.homeScreen.name);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colours.primary,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Lottie.asset(
              'assets/lottie/success.json',
              width: 220,
              repeat: false,
            ),

            const SizedBox(height: 20),

            Text(
              'Product Added!',
              style: TextStyle(
                fontFamily: Fonts.sSemiBold,
                fontSize: 20,
                color: Colors.white,
              ),
            ),

            const SizedBox(height: 8),

            const Text(
              'Your product was added successfully',
              style: TextStyle(fontSize: 14, color: Colors.white70),
            ),
          ],
        ),
      ),
    );
  }
}

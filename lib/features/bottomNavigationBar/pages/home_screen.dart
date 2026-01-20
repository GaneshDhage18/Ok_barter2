import 'package:flutter/material.dart';

import 'package:okbarter2/core/const/colours.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colours.primary,
      body: Container(
        width: double.infinity,
        height: double.infinity,

        child: Center(child: Text("HomeScreen")),
      ),
    );
  }
}

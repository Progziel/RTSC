import 'dart:async';
import 'dart:ui';

import 'package:boxing/constants/colors.dart';
import 'package:boxing/screens/onboard/onboardscreen.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Timer.periodic(const Duration(seconds: 3), (timer) {
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => const OnboardScreenPage()),
        (Route<dynamic> route) => false,
      );
      timer.cancel();
    });
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
        child: Container(
          color: themeBackgroundcolor,
          child: Center(
            child: Image.asset("images/logo.png"),
          ),
        ),
      ),
    );
  }
}

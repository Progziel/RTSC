import 'dart:async';
import 'dart:ui';

import 'package:boxing/constants/colors.dart';
import 'package:boxing/global_var.dart';
import 'package:boxing/screens/onboard/boarding_screens%20(1).dart';
import 'package:boxing/screens/onboard/onboardscreen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'screens/dashboard.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final uId = locator.read('userId');
  @override
  void initState() {
    Timer.periodic(const Duration(seconds: 3), (timer) {
      uId != null ? Get.offAll(()=> BottomBar()) : Get.offAll(()=> BoardingScreen());

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

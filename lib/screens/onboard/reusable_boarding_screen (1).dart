// ignore_for_file: avoid_unnecessary_containers

import 'package:boxing/classes/custom_button.dart';
import 'package:boxing/classes/custom_text.dart';
import 'package:boxing/screens/credential/loginpage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class ReUsableBoardingScreen extends StatefulWidget {
  final String mainHeading1;
  final String subHeading;
  final bool lastScreen;
  const ReUsableBoardingScreen(
      {super.key,
      required this.mainHeading1,
      required this.subHeading,
      required this.lastScreen});

  @override
  State<ReUsableBoardingScreen> createState() => _ReUsableBoardingScreenState();
}

class _ReUsableBoardingScreenState extends State<ReUsableBoardingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Stack(
        children: [
          // Positioned(
          //   top: -650,
          //   left: 0,
          //   right: 0,
          //   child: Transform.rotate(
          //     angle: pi / 2.5,
          //     child: Container(height: 1550, color: themecolordark),
          //   ),
          // ),
          Positioned(
            bottom: 480,
            left: 30,
            right: 30,
            child: Text(
              "Every Fight",
              style: GoogleFonts.bebasNeue(
                  letterSpacing: 2,
                  fontSize: 65,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
          ),
          Positioned(
            bottom: 430,
            left: 30,
            right: 30,
            child: Text(
              "One Place",
              style: GoogleFonts.bebasNeue(
                  letterSpacing: 2,
                  fontSize: 50,
                  fontWeight: FontWeight.bold,
                  color: const Color(0xffFF0007)),
            ),
          ),
          Positioned(
            bottom: 280,
            left: 30,
            right: 30,
            child: Text(
              widget.mainHeading1,
              style: GoogleFonts.bebasNeue(
                letterSpacing: 2,
                fontSize: 22,
                fontWeight: FontWeight.w700,
                color: Colors.black,
              ),
            ),
          ),
          // Positioned(
          //   bottom: 260,
          //   left: 30,
          //   right: 30,
          //   child: Text(
          //     widget.mainHeading2,
          //     style: GoogleFonts.bebasNeue(
          //       letterSpacing: 2,
          //       fontSize: 30,
          //       fontWeight: FontWeight.w700,
          //       color: Colors.black,
          //     ),
          //   ),
          // ),
          Positioned(
              bottom: 180,
              left: 30,
              right: 30,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomTextWidget(
                    text: widget.subHeading,
                    textColor: Colors.grey,
                  ),
                ],
              )),
          Positioned(
              left: 30,
              bottom: 100,
              child: Visibility(
                visible: widget.lastScreen == true,
                child: CustomButton(
                  buttonText: 'Get Started',
                  width: Get.width * 0.85,
                  onTap: () => Get.to(const LoginPage(),
                      transition: Transition.rightToLeft),
                ),
              ))
        ],
      ),
    );
  }
}

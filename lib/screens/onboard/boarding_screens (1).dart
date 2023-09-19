import 'dart:math';

import 'package:boxing/constants/colors.dart';
import 'package:boxing/screens/onboard/reusable_boarding_screen%20(1).dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class BoardingScreen extends StatefulWidget {
  const BoardingScreen({super.key});

  @override
  State<BoardingScreen> createState() => _BoardingScreenState();
}

class _BoardingScreenState extends State<BoardingScreen> {
  final PageController _controller = PageController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: themeBackgroundcolor,
      body: Stack(
        children: [
          Positioned(
            top: -200,
            left: 0,
            right: 0,
            child: Transform.rotate(
              angle: pi / 2.5,
              child: Container(height: Get.height / 1.2, color: themecolordark),
            ),
          ),
          PageView(
            controller: _controller,
            children: const [
              ReUsableBoardingScreen(
                mainHeading1: 'Real Time Updates\nAll Content. One Place.',
                subHeading:
                    'Real Time Updates\nPre-fight\nDuring the fight and Post-fight',
                lastScreen: false,
              ),
              ReUsableBoardingScreen(
                mainHeading1:
                    'PR teams and media rejoice!\nNo more responding to every journalist individually.',
                subHeading:
                    'A centralized platform for PR professionals to upload and share information with members of the media.',
                lastScreen: false,
              ),
              ReUsableBoardingScreen(
                mainHeading1:
                    'Live stats provided by boxing’s premier punch stat tracker, Compubox.',
                subHeading: '',
                lastScreen: true,
              ),
            ],
          ),
          Container(
            alignment: const Alignment(0, 0.9),
            child: SmoothPageIndicator(
                controller: _controller,
                count: 3,
                effect: ExpandingDotsEffect(
                    activeDotColor: themecolordark,
                    strokeWidth: 1,
                    dotHeight: 5)),
          )
        ],
      ),
    );
  }
}

import 'dart:math';

import 'package:boxing/constants/colors.dart';
import 'package:boxing/screens/credential/loginpage.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class OnboardScreenPage extends StatefulWidget {
  const OnboardScreenPage({super.key});

  @override
  State<OnboardScreenPage> createState() => _OnboardScreenPageState();
}

class _OnboardScreenPageState extends State<OnboardScreenPage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        SizedBox(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: PageView.builder(
              itemCount: 3,
              itemBuilder: (context, positiion) {
                return Stack(
                  children: [
                    Positioned(
                      top: -650,
                      left: 0,
                      right: 0,
                      child: Transform.rotate(
                        angle: pi / 2.5,
                        child: Container(height: 1550, color: themecolordark),
                      ),
                    ),
                    stackwidget(titlelist[positiion], valuelist[positiion],
                        positiion, context),
                  ],
                );
              }),
        ),
      ],
    ));
  }

  List<String> titlelist = [
    "Real Time Updates: All Content. One Place.",
    "PR teams and media rejoice!\nNo more responding to every journalist individually.",
    "Live stats provided by boxing’s premier punch stat tracker, Compubox.",
  ];

  List<String> valuelist = [
    "Stay ahead of the game with real-time match updates. From nail-biting title fights to undercard events, we've got you covered with all the action-packed moments.",
    "A centralized platform for PR professionals to upload and share information with members of the media.",
    "",
  ];
}

stackwidget(String title, String value, index, BuildContext context) {
  return Stack(
    clipBehavior: Clip.hardEdge,
    children: [
      // Positioned(
      //   bottom: 401,
      //   left: 0,
      //   top: 0,
      //   right: -70,
      //   child: Transform.rotate(
      //     angle: pi / -10, // Rotate by 45 degrees (pi/4 radians)
      //     child: SizedBox(
      //       child: Image.asset(
      //         "images/icon.png",
      //         fit: BoxFit.contain,
      //       ),
      //     ),
      //   ),
      // ),

      Positioned(
          bottom: 560,
          left: 30,
          right: 30,
          child: Text(
            "Every Fight",
            style: GoogleFonts.bebasNeue(
                letterSpacing: 2,
                fontSize: 65,
                fontWeight: FontWeight.bold,
                color: Colors.white),
          )),
      Positioned(
          bottom: 510,
          left: 30,
          right: 30,
          child: Text(
            "One Place",
            style: GoogleFonts.bebasNeue(
                letterSpacing: 2,
                fontSize: 50,
                fontWeight: FontWeight.bold,
                color: const Color(0xffFF0007)),
          )),

      Positioned(
          bottom: index == 0
              ? 300
              : index == 1
                  ? 220
                  : 270,
          left: 30,
          right: index == 2 ? 50 : 70,
          child: Text(
            title,
            style: const TextStyle(fontSize: 24, fontWeight: FontWeight.w700),
          )),
      Positioned(
          bottom: index == 2
              ? 220
              : index == 1
                  ? 150
                  : index == 0
                      ? 220
                      : 180,
          left: 30,
          right: 30,
          child: index == 0
              ? Column(
                  children: [1, 2, 3, 4]
                      .map((e) => Row(
                            children: [
                              Text(e == 1
                                  ? "Real Time Updates"
                                  : e == 2
                                      ? "Pre-fight"
                                      : e == 3
                                          ? "During the fight"
                                          : "Post-fight")
                            ],
                          ))
                      .toList(),
                )
              : Text(
                  value,
                  style: const TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                      color: Color(0xff665A5A)),
                )),
      Positioned(
          bottom: 100,
          left: 30,
          right: 20,
          child: index == 2
              ? MaterialButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const LoginPage()),
                    );
                  },
                  child: Container(
                    decoration: BoxDecoration(
                        color: const Color(0xffFF0007),
                        borderRadius: BorderRadius.circular(10)),
                    width: double.infinity,
                    height: 52,
                    child: const Center(
                      child: Text(
                        "Get Started",
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                )
              : DotsIndicator(
                  dotsCount: 3,
                  position: index,
                  decorator: DotsDecorator(
                    color: const Color(0xffD9D9D9),
                    activeColor: themecolordark,
                    activeSize: const Size(50.0, 9.0),
                    activeShape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5.0)),
                  ),
                ))
    ],
  );
}

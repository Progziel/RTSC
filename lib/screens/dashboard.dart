import 'package:boxing/constants/colors.dart';
import 'package:boxing/screens/boxers/boxers.dart';
import 'package:boxing/screens/homescreens/loginpage.dart';
import 'package:boxing/screens/chatscreen/chatscreen.dart';
import 'package:boxing/screens/newsarticles/newsarticle.dart';
import 'package:boxing/screens/profile/profilepage.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  int currentindex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screenlist[currentindex],
      backgroundColor: themeBackgroundcolor,
      persistentFooterAlignment: AlignmentDirectional.bottomEnd,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Container(
        width: MediaQuery.of(context).size.width,
        height: 80,
        color: Colors.white,
        child: Row(
          children: [0, 1, 2]
              .map((e) => Expanded(
                      child: Center(
                          child: IconButton(
                    onPressed: () {
                      setState(() {
                        currentindex = e;
                      });
                    },
                    icon: Icon(
                      dashboardicons[e],
                      size: 25,
                      color:
                          currentindex == e ? themepickcolor : Colors.grey[400],
                    ),
                  ))))
              .toList(),
        ),
      ),
    );
  }

  List<IconData> dashboardicons = [
    Icons.home,

    Iconsax.tag,
    // Iconsax.profile_circle,
    Iconsax.personalcard
  ];

  List<Widget> screenlist = [
    const Homescreenpage(),

    const ChatscreenPage(),
    // const BoxersRecords(),
    const ProfilePage()
  ];
}

import 'package:boxing/classes/custom_toast.dart';
import 'package:boxing/constants/colors.dart';
import 'package:boxing/controller/controller.dart';
import 'package:boxing/screens/chatscreen/chatscreen.dart';
import 'package:boxing/screens/homescreens/home_screen.dart';
import 'package:boxing/screens/newsarticles/newsarticle.dart';
import 'package:boxing/screens/profile/profilepage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
class DashboardScreen extends StatefulWidget {
  final String? userId;
  const DashboardScreen({super.key, this.userId});
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
          children: [0, 1, 2, 3]
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
    Icons.article,
    Icons.tag,
    Icons.person
  ];
  List<Widget> screenlist = [
    const Homescreenpage(),
    const NewsArticlesPage(),
    const ChatscreenPage(),
    const ProfilePage(),
  ];
}
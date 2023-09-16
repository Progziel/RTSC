import 'package:boxing/classes/custom_toast.dart';
import 'package:boxing/constants/colors.dart';
import 'package:boxing/controller/controller.dart';
import 'package:boxing/screens/chatscreen/chatscreen.dart';
import 'package:boxing/screens/homescreens/home_screen.dart';
import 'package:boxing/screens/newsarticles/newsarticle.dart';
import 'package:boxing/screens/profile/profilepage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';



class BottomBar extends StatefulWidget {
  const BottomBar({
    Key? key,
  }) : super(key: key);
  @override
  State<BottomBar> createState() => _BottomBarState();
}
class _BottomBarState extends State<BottomBar> {
  int _selectedIndex = 0;
  late List<Widget> _widgetOptions;
  late List<BottomNavigationBarItem> _bottomNavBarItems;
  bool isDriver = true;
  @override
  void initState() {
    super.initState();
    _widgetOptions = <Widget>[
      const Homescreenpage(),
      const NewsArticlesPage(),
      const ChatscreenPage(),
      const ProfilePage(),
    ];
    _bottomNavBarItems = const [
      BottomNavigationBarItem(
          icon: Icon(
            CupertinoIcons.home,
            color: Colors.black26,
          ),
          activeIcon: Icon(
            CupertinoIcons.house_fill,
            color: Colors.black,
          ),
          label: ''),
      BottomNavigationBarItem(
          icon: Icon(
            CupertinoIcons.square_list,
            color: Colors.black26,
          ),
          activeIcon: Icon(
            CupertinoIcons.square_list_fill,
            color: Colors.black,
          ),
          label: ''),
      BottomNavigationBarItem(
          icon: Icon(
            CupertinoIcons.tag,
            color: Colors.black26,
          ),
          activeIcon: Icon(
            CupertinoIcons.tag_fill,
            color: Colors.black,
          ),
          label: ''),
      BottomNavigationBarItem(
          icon: Icon(
            CupertinoIcons.person,
            color: Colors.black26,
          ),
          activeIcon: Icon(
            CupertinoIcons.person_fill,
            color: Colors.black,
          ),
          label: ''),
    ];
    _selectedIndex = 0;
  }
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Center(
        child: _widgetOptions[_selectedIndex],
      ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: _onItemTapped,
        currentIndex: _selectedIndex,
        elevation: 10,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.blueGrey,
        type: BottomNavigationBarType.fixed,
        items: _bottomNavBarItems,
      ),
    );
  }
}
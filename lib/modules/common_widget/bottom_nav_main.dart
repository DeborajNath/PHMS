import 'package:flutter/material.dart';

import '../alert_screen/screen_alert.dart';
import '../create_surgery_plan_screen/create_surgery_plan.dart';
import '../home_screen/screen_main_home.dart';
import '../more_screen/screen_more.dart';
import '../surgery_upcoming_return_screen/screen_surgery_upcoming_return.dart';

class BottomNavMainScreen extends StatefulWidget {
  final int screenIndex;
  const BottomNavMainScreen({super.key, required this.screenIndex});

  @override
  State<BottomNavMainScreen> createState() => _BottomNavMainScreenState();
}

class _BottomNavMainScreenState extends State<BottomNavMainScreen> {
  late int _currentSelectedIndex;
  @override void initState() { super.initState(); _currentSelectedIndex = widget.screenIndex; }
  // int _currentSelectedIndex = widget.screenIndex;
  final bool botomnav = true;

  // bottom nav pages list
  final _pages = [
    Screenmain(),
    ScreenSurgery(),
    CreateSurgeryPlan(),
    ScreenAlert(),
    ScreenMore(),
  ];

  final List<BottomNavigationBarItem> _bottomNavigationItems = [
    const BottomNavigationBarItem(
        icon: ImageIcon(AssetImage('assets/home.png')), label: 'home'),
    const BottomNavigationBarItem(
        icon: ImageIcon(AssetImage('assets/calender_Bottom_nav.png')),
        label: 'Surgery'),
    const BottomNavigationBarItem(
        icon: ImageIcon(
          AssetImage('assets/add.png'),
          size: 80,
          color: Color(0xffF3A525),
        ),
        label: ''),
    const BottomNavigationBarItem(
        icon: ImageIcon(AssetImage('assets/notification.png')),
        label: 'Alerts'),
    const BottomNavigationBarItem(
        icon: ImageIcon(AssetImage('assets/more.png')), label: 'More'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: (_currentSelectedIndex == 2)
            ? Scaffold(
                body: _pages[_currentSelectedIndex],
                bottomNavigationBar: null,
              )
            : Scaffold(
                body: _pages[_currentSelectedIndex],
                bottomNavigationBar: BottomNavigationBar(
                    currentIndex: _currentSelectedIndex,
                    onTap: (newIndex) {
                      setState(() {
                        _currentSelectedIndex = newIndex;
                      });
                    },
                    selectedItemColor: Color(0xff124164),
                    unselectedItemColor: Color(0xff999999),
                    showUnselectedLabels: mounted,
                    type: BottomNavigationBarType.fixed,
                    iconSize: 25,
                    items: _bottomNavigationItems)));
  }
}

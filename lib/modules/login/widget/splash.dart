import 'dart:async';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../common_widget/bottom_nav_main.dart';
import '../login_screen.dart';
import 'package:jwt_decoder/jwt_decoder.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    checkUserLoggedIn();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Container(
        constraints: BoxConstraints.expand(),
        decoration: const BoxDecoration(
          // color: Color(0xffF3A525),
          image: DecorationImage(
              image: AssetImage("assets/flash.png"), fit: BoxFit.cover),
        ),
      ),
    ));
  }

  Future<void> checkUserLoggedIn() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('access_token');
    if (token != null) {
      bool isTokenValid = JwtDecoder.isExpired(token);
      if (!isTokenValid) {
        Timer(
            const Duration(seconds: 1),
            () => Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                    builder: (context) => const BottomNavMainScreen(
                          screenIndex: 0,
                        ))));
      } else {
        Timer(
            const Duration(seconds: 5),
            () => Navigator.pushReplacement(context,
                MaterialPageRoute(builder: (context) => const LoginPage())));
      }
    } else {
      Timer(
          const Duration(seconds: 5),
          () => Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (context) => const LoginPage())));
    }
  }
}

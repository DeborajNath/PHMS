import 'dart:ui';
import "package:flutter/material.dart";
import 'widget/white_background.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Color(0xffF3A525),
      body: SizedBox(
          child: Center(
        child: Column(
          children: [
            SizedBox(
              height: 100,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'ABCD',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 40,
                      fontWeight: FontWeight.w800),
                ),
                Text(
                  '®',
                  style: TextStyle(fontFeatures: [FontFeature.superscripts()]),
                ),
              ],
            ),
            Text(
              'Hospital Staff App',
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
              ),
            ),
            SizedBox(
              height: 50,
            ),
            Expanded(child: WhiteBackground())
          ],
        ),
      )),
    );
  }
}

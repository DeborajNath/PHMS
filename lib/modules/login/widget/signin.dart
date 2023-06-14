import 'package:flutter/material.dart';

class Signin extends StatelessWidget {
  const Signin({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Align(
        alignment: Alignment.bottomCenter,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text("Don't not have account?"),
            TextButton(
              child: const Text(
                'Sign up',
                style: TextStyle(
                  color: Color(0xffF3A525),
                ),
              ),
              onPressed: () {
                //signup screen
              },
            )
          ],
        ),
      )),
    );
  }
}

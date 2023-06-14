import 'package:flutter/material.dart';

import 'login_form.dart';

class WhiteBackground extends StatelessWidget {
  const WhiteBackground({super.key});
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(60),
            topRight: Radius.circular(60),
          )),
      child: Column(
        children: const [
          SizedBox(
            height: 80,
          ),
          Expanded(child: LoginForm())
        ],
      ),
    );
  }
}

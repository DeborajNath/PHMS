import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:phms_project_mobile/modules/home_screen/widget/card_main.dart';
import 'package:phms_project_mobile/modules/surgery_upcoming_return_screen/widget/surgeryList.dart';

class UpcomingCasesList extends StatelessWidget {
  const UpcomingCasesList({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        Text(
          "Today",
          style: TextStyle(
              color: Color(0xff124164),
              fontSize: 20,
              fontFamily: 'Poppins',
              letterSpacing: 1.0,
              fontWeight: FontWeight.w600),
        ),
        Expanded(child: SurgeryList())
      ],
    );
  }
}

import 'package:flutter/material.dart';

class UpcomingTabDashboard extends StatelessWidget {
  const UpcomingTabDashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      // color: Colors.lightGreen,
      padding: const EdgeInsets.all(6),
      child: Row(
        children: [
          const Text(
            'Upcoming Schedule',
            style: TextStyle(
                color: Color(0xff124164),
                fontSize: 16,
                fontFamily: 'Poppins',
                letterSpacing: 1.0,
                fontWeight: FontWeight.w800),
          ),
          const Spacer(),
          TextButton(
            onPressed: () {
              // _navigateToNextScreen(context);
            },
            child: const Text(
              'See all',
              style: TextStyle(
                  color: Color(0xff124164),
                  fontSize: 16,
                  fontFamily: 'Poppins',
                  letterSpacing: 1.0,
                  fontWeight: FontWeight.w400),
            ),
          )
        ],
      ),
    );
  }
  // void _navigateToNextScreen(BuildContext context) {
  //   Navigator.of(context)
  //       .push(MaterialPageRoute(builder: (context) => ScreenSurgery()));
  // }
}

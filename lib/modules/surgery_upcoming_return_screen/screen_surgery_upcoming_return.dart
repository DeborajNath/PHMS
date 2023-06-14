import 'package:flutter/material.dart';

import 'widget/return_case_list.dart';
import 'widget/upcoming_cases_list.dart';

class ScreenSurgery extends StatefulWidget {
  const ScreenSurgery({super.key});

  @override
  State<ScreenSurgery> createState() => _ScreenSurgeryState();
}

class _ScreenSurgeryState extends State<ScreenSurgery>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 255, 255, 255),
          title: const Text(
            'Surgery',
            style: TextStyle(
                fontSize: 18,
                color: Color(0xFF0D142A),
                fontFamily: 'Poppins',
                fontWeight: FontWeight.bold),
          ),
          actions: <Widget>[
            Padding(
                padding: const EdgeInsets.only(right: 20.0),
                child: GestureDetector(
                  onTap: () {},
                  child: const ImageIcon(
                    AssetImage("assets/filter.png"),
                    size: 16.0,
                    color: Color(0xFF0D142A),
                  ),
                )),
            Padding(
                padding: const EdgeInsets.only(right: 20.0),
                child: GestureDetector(
                  onTap: () {},
                  child: const ImageIcon(
                    AssetImage("assets/group.png"),
                    size: 16.0,
                    color: Color(0xFF0D142A),
                  ),
                )),
          ],
        ),
        body: Column(
          children: [
            Container(
              color: Colors.white,
              child: TabBar(
                controller: _tabController,
                labelColor: const Color(0xff124164),
                unselectedLabelColor: const Color.fromARGB(255, 108, 112, 115),
                tabs: const [
                  Tab(
                    child: Text(
                      'Upcoming',
                      style: TextStyle(
                          color: Color(0xff124164),
                          fontSize: 20,
                          fontFamily: 'Poppins',
                          letterSpacing: 1.0,
                          fontWeight: FontWeight.w400),
                    ),
                  ),
                  Tab(
                    child: Text(
                      'Return',
                      style: TextStyle(
                          color: Color(0xff124164),
                          fontSize: 20,
                          fontFamily: 'Poppins',
                          letterSpacing: 1.0,
                          fontWeight: FontWeight.w400),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: TabBarView(
                  controller: _tabController,
                  children: const [UpcomingCasesList(), ReturnCaseList()]),
            )
          ],
        ));
  }
}

import 'package:flutter/material.dart';

import '../../modules/common_widget/bottom_nav_main.dart';



class AppRoutes {
  static const String home = '/';
  static const String dashboard = '/dashboard';

  static final routes = <String, WidgetBuilder>{
    dashboard: (BuildContext context) => const BottomNavMainScreen(screenIndex: 0,),
    // profile: (BuildContext context) => ProfileScreen(),
  };
}

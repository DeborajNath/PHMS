import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:phms_project_mobile/store/bloc/create_surgery_bloc/create_surgery_bloc.dart';
import 'package:phms_project_mobile/store/bloc/surgery_room/surgery_room_details_bloc.dart';
import 'package:phms_project_mobile/store/bloc/surgery_staff_bloc/surgery_staff_bloc.dart';
import 'package:phms_project_mobile/store/login/log_in_bloc.dart';

import 'core/routes/routes.dart';
import 'modules/login/widget/splash.dart';
import 'services/doctor_card_details/doctor_card_details_service.dart';
import 'services/surgery_list_details/surgery_list_details_service.dart';
import 'services/user_details/user_details_service.dart';
import 'store/bloc/doctor_card_details_bloc/doctor_card_details_bloc.dart';
import 'store/bloc/surgery_list_bloc/surgery_list_bloc.dart';
import 'store/user_details_bloc/user_details_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<SurgeryStaffBloc>(
            create: (BuildContext context) => SurgeryStaffBloc()),
        BlocProvider<SurgeryRoomBloc>(
            create: (BuildContext context) => SurgeryRoomBloc()),
        BlocProvider<CreateSurgeryBloc>(
            create: (BuildContext context) => CreateSurgeryBloc()),
        BlocProvider<LogInBloc>(
          create: (BuildContext context) => LogInBloc(),
        ),
        BlocProvider<UserDetailsBloc>(
          create: (BuildContext context) => UserDetailsBloc(UserRepository()),
        ),
        BlocProvider<DoctorCardDetailsBloc>(
          create: (BuildContext context) =>
              DoctorCardDetailsBloc(DoctorCardRepository()),
        ),
        BlocProvider<SurgeryListDetailsBloc>(
          create: (BuildContext context) =>
              SurgeryListDetailsBloc(SurgeryListRepository()),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.lightBlue,
        ),
        home: SplashScreen(),
        routes: AppRoutes.routes,
      ),
    );
  }
}

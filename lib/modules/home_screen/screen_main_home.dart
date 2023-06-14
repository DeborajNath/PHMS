import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:phms_project_mobile/modules/surgery_upcoming_return_screen/widget/surgeryList.dart';
import '../../services/user_details/user_details_service.dart';
import '../../store/user_details_bloc/user_details_bloc.dart';
import '../home_screen/widget/section_1_row.dart';
import 'widget/card_main.dart';
import 'widget/doctors_details_card_widget.dart';
import 'widget/section_2_texfield_widget.dart';
import 'widget/upcoming_tab_dashboard.dart';

class Screenmain extends StatefulWidget {
  const Screenmain({super.key});
  @override
  State<Screenmain> createState() => _ScreenmainState();
}

class _ScreenmainState extends State<Screenmain> {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<UserDetailsBloc>(
            create: (BuildContext context) =>
                UserDetailsBloc(UserRepository())),
      ],
      child: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(height: 100, child: const Section1Row()),
              const SizedBox(
                height: 10,
              ),
              const Setion2TextfieldWidget(),
              const DoctorDeatailsCardWidget(),
              const UpcomingTabDashboard(),
              const SurgeryList()
            ],
          ),
        ),
      ),
    );
  }
}

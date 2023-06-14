import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:phms_project_mobile/modules/create_surgery_plan_screen/widgets/bottom_nav_create.dart';
import 'package:phms_project_mobile/modules/create_surgery_plan_screen/widgets/choose_surgeon.dart';
import 'package:phms_project_mobile/modules/create_surgery_plan_screen/widgets/choose_surgery.dart';
import 'package:phms_project_mobile/modules/create_surgery_plan_screen/widgets/dropdown_roomno.dart';
import 'package:phms_project_mobile/modules/create_surgery_plan_screen/widgets/table_calender.dart';
import 'package:phms_project_mobile/modules/create_surgery_plan_screen/widgets/time_button.dart';

import '../../store/bloc/create_surgery_bloc/create_surgery_bloc.dart';
import '../../store/bloc/surgery_room/surgery_room_details_bloc.dart';
import '../../store/bloc/surgery_room/surgery_room_details_event.dart';
import '../../store/bloc/surgery_room/surgery_room_details_state.dart';
import '../../store/bloc/surgery_staff_bloc/surgery_staff_bloc.dart';
import '../../store/bloc/surgery_staff_bloc/surgery_staff_event.dart';
import '../../store/bloc/surgery_staff_bloc/surgery_staff_state.dart';
import '../common_widget/bottom_nav_main.dart';


class CreateSurgeryPlan extends StatefulWidget {
  const CreateSurgeryPlan({super.key});

  @override
  State<CreateSurgeryPlan> createState() => _CreateSurgeryPlanState();
}

class _CreateSurgeryPlanState extends State<CreateSurgeryPlan> {
  bool isValidPhoneNumber = false;
  bool isValidName = false;

  @override
  void initState() {
    context.read<SurgeryStaffBloc>().add(GetStaffDetailsEvent());
    context.read<SurgeryRoomBloc>().add(GetAllRooms());
    super.initState();
  }

  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 1,
        leading: InkWell(
          key: const Key("backArrowInkWell"),
          child: const Icon(Icons.arrow_back_ios_rounded, color: Colors.black),
          onTap: () {
              showDialog(context: context,builder: (BuildContext context) {
                return AlertDialog(
                  title: const Text('Go back?'),
                  content: const Text('Are you sure you want to go back? Any unsaved changes will be lost.'),
                  actions: <Widget>[
                    TextButton(
                      onPressed: () => Navigator.of(context).pop(false),
                      child: const Text('No'),
                    ),
                    TextButton(
                      onPressed: () => Navigator.of(context).pop(true),
                      child: const Text('Yes'),
                    ),
                  ],
                );
              },
              ).then((value) {
                if (value == true) {
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const BottomNavMainScreen(screenIndex: 0,)));
               }
              });
            },
                
        ),
        centerTitle: true,
        title: const Text(
          "Create a Surgery Plan",
          style: TextStyle(
              color: Colors.black,
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w500),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                const TableCalenderWidget(),
                const Divider(
                  height: 25,
                  thickness: 2,
                  indent: 0,
                  endIndent: 0,
                  color: Color.fromRGBO(238, 239, 244, 1),
                ),
                const TimeButtonWidget(),
                const Divider(
                  height: 30,
                  thickness: 2,
                  indent: 0,
                  endIndent: 0,
                  color: Color.fromRGBO(238, 239, 244, 1),
                ),
                const Align(
                  alignment: Alignment.center,
                  child: Text(
                    "Choose Surgeons ",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Color.fromRGBO(18, 65, 100, 1),
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                BlocBuilder<SurgeryStaffBloc, SurgeryStaffState>(
                    builder: (context, state) {
                  if (state is SurgeryStaffSuccess) {
                    return Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SurgeonWidget(
                            surgerystaffmodel: state.surgerystaffmodel,
                          ),
                        ]);
                  } else {
                    return const SpinKitFadingCircle(
                      color: Color.fromRGBO(18, 65, 100, 1),
                      size: 40.0,
                    );
                  }
                }),
                const SizedBox(height: 20),
                const Align(
                  alignment: Alignment.center,
                  child: Text(
                    "Surgery Type ",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Color.fromRGBO(18, 65, 100, 1),
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                const SurgeryWidget(),
                const SizedBox(height: 25),
                const Align(
                  alignment: Alignment.center,
                  child: Text(
                    "Patient Details",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Color.fromRGBO(18, 65, 100, 1),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                const Text(
                  "Patient Name",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.normal,
                    color: Colors.black,
                    fontStyle: FontStyle.normal,
                  ),
                  textAlign: TextAlign.left,
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                  child: TextFormField(
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter Patient name';
                      } else {
                        isValidName = true;
                        setState(() {});
                        return null;
                      }
                    },
                    onChanged: (value) {
                      context.read<CreateSurgeryBloc>().data['patientName'] =
                          value;
                      _formKey.currentState!.validate();
                    },
                    decoration: InputDecoration(
                      border: const OutlineInputBorder(),
                      hintText: 'Enter Name',
                      suffixIcon: isValidName
                          ? const Icon(
                              Icons.check,
                              color: Colors.green,
                            )
                          : null,
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                const Text(
                  "Phone Number",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.normal,
                    color: Colors.black,
                    fontStyle: FontStyle.normal,
                  ),
                  textAlign: TextAlign.left,
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                  child: TextFormField(
                    //autovalidateMode: AutovalidateMode.onUserInteraction,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter Phone Number';
                      } else if (value.length != 10) {
                        return 'Mobile Number must be of 10 digit';
                      } else {
                        isValidPhoneNumber = true;
                        setState(() {});
                        return null;
                      }
                    },
                    onChanged: (value) {
                      context.read<CreateSurgeryBloc>().data['patientContact'] =
                          value;
                      _formKey.currentState!.validate();
                    },
                    decoration: InputDecoration(
                      border: const OutlineInputBorder(),
                      hintText: 'Enter Phone Number',
                      suffixIcon: isValidPhoneNumber
                          ? const Icon(
                              Icons.check,
                              color: Colors.green,
                            )
                          : null,
                    ),
                  ),
                ),
                const SizedBox(height: 25),
                const Align(
                  alignment: Alignment.center,
                  child: Text(
                    "Surgery Details",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Color.fromRGBO(18, 65, 100, 1),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                const Text(
                  "Surgery Room ",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.normal,
                    color: Colors.black,
                    fontStyle: FontStyle.normal,
                  ),
                  textAlign: TextAlign.left,
                ),
                BlocBuilder<SurgeryRoomBloc, SurgeryRoomState>(
                    builder: (context, state) {
                  if (state is SurgeryRoomsFetched) {
                    return DropDownWidget(
                      surgeryRoomModel: state.surgeryRoomModel,
                    );
                  } else {
                    return const SpinKitFadingCircle(
                      color: Color.fromRGBO(18, 65, 100, 1),
                      size: 40.0,
                    );;
                  }
                }),
                const SizedBox(height: 20),
                const Text(
                  "Notes (Optional) ",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.normal,
                    color: Colors.black,
                    fontStyle: FontStyle.normal,
                  ),
                  textAlign: TextAlign.left,
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                  child: TextField(
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                    ),
                    minLines: 5,
                    maxLines: 8,
                    keyboardType: TextInputType.multiline,
                    onChanged: (value) {
                      context.read<CreateSurgeryBloc>().data['notes'] =
                          value;
                    },
                  ),
                ),
                const SizedBox(height: 15),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: BottomNavCreateSurgery(
        formKey: _formKey,
      ),
    );
  }
}

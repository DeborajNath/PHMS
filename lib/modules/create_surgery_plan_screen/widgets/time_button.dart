import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../store/bloc/surgery_staff_bloc/surgery_staff_bloc.dart';
import '../../../store/bloc/surgery_staff_bloc/surgery_staff_event.dart';

class TimeButtonWidget extends StatefulWidget {
  const TimeButtonWidget({super.key});

  @override
  State<TimeButtonWidget> createState() => _TimeButtonWidgetState();
}

class Data {
  bool? active;
  String? time;

  Data({this.active, this.time});
}

class _TimeButtonWidgetState extends State<TimeButtonWidget> {
  List<Data> data = [
    Data(active: true, time: "08:00 AM"),
    Data(active: false, time: "10:00 AM"),
    Data(active: false, time: "12:00 PM"),
    Data(active: false, time: "04:00 PM"),
    Data(active: false, time: "06:00 PM")
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: data.length,
          itemBuilder: (BuildContext context, int index) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: OutlinedButton(
                  onPressed: () {
                    for (int i = 0; i < data.length; i++) {
                      if (i != index) {
                        data[i].active = false;
                      } else {
                        data[i].active = true;
                      }
                      setState(() {});
                    }
                    context.read<SurgeryStaffBloc>().time = data[index].time!;
                    context
                        .read<SurgeryStaffBloc>()
                        .add(GetStaffDetailsEvent());
                  },
                  style: OutlinedButton.styleFrom(
                    backgroundColor: data[index].active!
                        ? const Color.fromRGBO(19, 68, 105, 1)
                        : Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 30, vertical: 15),
                    textStyle: const TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  child: Text(
                    data[index].time!,
                    style: TextStyle(
                        fontSize: 15,
                        color: data[index].active!
                            ? Colors.white
                            : const Color.fromRGBO(18, 65, 100, 1)),
                  )),
            );
          }),
    );
  }
}

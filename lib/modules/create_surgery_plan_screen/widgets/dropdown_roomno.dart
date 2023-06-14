import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../models/surgery_rooms_details.dart';
import '../../../store/bloc/create_surgery_bloc/create_surgery_bloc.dart';

class DropDownWidget extends StatefulWidget {
  final SurgeryRoomModel? surgeryRoomModel;

  const DropDownWidget({super.key, this.surgeryRoomModel});

  @override
  State<DropDownWidget> createState() => _DropDownWidgetState();
}

class _DropDownWidgetState extends State<DropDownWidget> {
  String? selectedValue;

  @override
  Widget build(BuildContext context) {
    return DropdownButtonHideUnderline(
        child: Container(
      margin: const EdgeInsets.only(top: 10, right: 5, left: 5),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
      ),
      child: DropdownButton<String>(
        isDense: true,
        isExpanded: true,
        value: selectedValue,
        hint: const Text("Surgery Room No."),
        items: widget.surgeryRoomModel!.surgeryRooms!
            .map((e) => DropdownMenuItem<String>(value: e, child: Text(e)))
            .toList(),
        onChanged: (v) {
          setState(() {
            context.read<CreateSurgeryBloc>().data['room'] =
                          v;
            selectedValue = v;
          });
        },
      ),
    ));
  }
}

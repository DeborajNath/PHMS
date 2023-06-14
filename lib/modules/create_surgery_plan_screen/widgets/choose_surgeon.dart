import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../models/surgery_staff_model.dart';
import '../../../store/bloc/create_surgery_bloc/create_surgery_bloc.dart';

class SurgeonWidget extends StatefulWidget {
  final List<SurgeryStaffModel> surgerystaffmodel;
  const SurgeonWidget({super.key, required this.surgerystaffmodel});

  @override
  State<SurgeonWidget> createState() => _SurgeonWidgetState();
}

class _SurgeonWidgetState extends State<SurgeonWidget> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 130,
      width: MediaQuery.of(context).size.width * .80,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: widget.surgerystaffmodel.length,
        itemBuilder: (BuildContext context, int index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: InkWell(
              onTap: () {
                if (widget.surgerystaffmodel[index].active == true) {
                  context.read<CreateSurgeryBloc>().data['staff'];
                } else {
                  context.read<CreateSurgeryBloc>().data['staff'].add(
                    {
                      "id": widget.surgerystaffmodel[index].id.toString(),
                      "hospitalId":
                          widget.surgerystaffmodel[index].hospitalId.toString(),
                      "name": widget.surgerystaffmodel[index].name.toString(),
                      "patientCount": widget
                          .surgerystaffmodel[index].patientCount
                          .toString(),
                      "specialized": widget
                          .surgerystaffmodel[index].specialiazed
                          .toString(),
                      "experience":  widget
                          .surgerystaffmodel[index].experience
                          .toString(),  
                    },
                  );
                }
                widget.surgerystaffmodel[index].active =
                    !widget.surgerystaffmodel[index].active!;

                 setState(() {});
              },
              child: Container(
                height: 110,
                width: 95,
                decoration: BoxDecoration(
                    image: const DecorationImage(
                      alignment: AlignmentDirectional.topEnd,
                      image: AssetImage("assets/whiteTick.png"),
                    ),
                    border: widget.surgerystaffmodel[index].active!
                        ? Border.all(
                            color: const Color.fromRGBO(18, 65, 100, 1),
                          )
                        : Border.all(color: Colors.grey.withOpacity(0.3))),
                child: Column(
                  children: [
                    const SizedBox(
                      height: 10,
                    ),
                    Image.asset(
                      "assets/image.png",
                      height: 60,
                    ),
                    Text(
                      widget.surgerystaffmodel[index].name.toString(),
                      style: const TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.normal,
                        color: Color.fromRGBO(18, 65, 100, 1),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

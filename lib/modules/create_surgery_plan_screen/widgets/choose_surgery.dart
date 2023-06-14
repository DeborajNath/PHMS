import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../store/bloc/create_surgery_bloc/create_surgery_bloc.dart';
import '../../../store/bloc/surgery_room/surgery_room_details_bloc.dart';
import '../../../store/bloc/surgery_room/surgery_room_details_state.dart';

class SurgeryWidget extends StatefulWidget {
  const SurgeryWidget({super.key});

  @override
  State<SurgeryWidget> createState() => _SurgeryWidgetState();
}

class _SurgeryWidgetState extends State<SurgeryWidget> {
  int? activeIndex;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SurgeryRoomBloc, SurgeryRoomState>(
        builder: (context, state) {
      if (state is SurgeryRoomsFetched) {
        return SizedBox(
          height: 130,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: state.surgeryRoomModel!.surgeryTypes!.length,
            itemBuilder: (BuildContext context, int index) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: InkWell(
                  key: Key('surgeryItem-$index'),
                  onTap: () {
                    activeIndex = index;
                    context.read<CreateSurgeryBloc>().data['surgeryType'] =
                        state.surgeryRoomModel!.surgeryTypes![index].toString();
                    setState(() {});
                
                  },
                  child: Container(
                    height: 110,
                    width: MediaQuery.of(context).size.width * 0.27,
                    decoration: BoxDecoration(
                      border: activeIndex == index
                          ? Border.all(
                              color: const Color.fromRGBO(18, 65, 100, 1),
                            )
                          : Border.all(color: Colors.grey.withOpacity(0.3)),
                    ),
                    child: Column(
                      children: [
                        Image.asset(
                          "assets/knee.png",
                          height: 70,
                        ),
                        Text(
                          state.surgeryRoomModel!.surgeryTypes![index]
                              .toString(),
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
      } else {
        return const SizedBox.shrink();
      }
    });
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../models/surgery_list_details_model.dart';
import '../../../services/surgery_list_details/surgery_list_details_service.dart';
import '../../../store/bloc/surgery_list_bloc/surgery_list_bloc.dart';
import '../../../store/bloc/surgery_list_bloc/surgery_list_event.dart';
import '../../../store/bloc/surgery_list_bloc/surgery_list_state.dart';

class SurgeryList extends StatelessWidget {
  const SurgeryList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SurgeryListDetailsBloc(
        SurgeryListRepository(),
      )..add(LoadSurgeryListEvent()),
      child: BlocBuilder<SurgeryListDetailsBloc, SurgeryListDetailsState>(
          builder: (context, state) {
        if (state is SurgeryListLoadingState) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        if (state is SurgeryListLoadedState) {
          List<SurgeryListDetailsModel> surgeryListCardDetails =
              state.surgeryListDetails;
          return SizedBox(
            height: 200,
            width: MediaQuery.of(context).size.width * .95,
            child: ListView.builder(
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                itemCount: surgeryListCardDetails.length,
                itemBuilder: (_, index) {
                  return Card(
                    elevation: 5,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    child: SizedBox(
                      height: 115,
                      width: MediaQuery.of(context).size.width * .95,
                      child: Container(
                        margin: const EdgeInsets.all(10),
                        child: Row(
                          children: <Widget>[
                            Expanded(
                              child: Column(
                                children: [
                                  Row(
                                    children: [
                                      Container(
                                        margin: const EdgeInsets.symmetric(
                                            horizontal: 10),
                                        child: Text(
                                          surgeryListCardDetails[index].name,
                                          style: const TextStyle(
                                            color: Color(0xff124164),
                                            fontSize: 14,
                                            fontFamily: 'Poppins',
                                            letterSpacing: .14,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                      ),
                                      const Icon(Icons.more_vert)
                                    ],
                                  ),
                                  Container(
                                    margin: const EdgeInsets.all(10),
                                    child: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: const <Widget>[
                                        ImageIcon(
                                          AssetImage(
                                              "assets/images/calender.png"),
                                          color: Color(0xff124164),
                                        ),
                                        Padding(
                                          padding: EdgeInsets.only(left: 8.0),
                                          child: Text(
                                            '3:00 PM, Oct 23,2022',
                                            style: TextStyle(
                                              color: Color(0xff124164),
                                              fontSize: 14,
                                              fontFamily: 'Poppins',
                                              letterSpacing: .14,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Container(
                                    margin: const EdgeInsets.symmetric(
                                        horizontal: 10),
                                    child: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: <Widget>[
                                        Container(
                                          width: 26.0,
                                          height: 26.0,
                                          decoration: BoxDecoration(
                                            color: const Color(0xff7c94b6),
                                            image: const DecorationImage(
                                              image: AssetImage(
                                                  'assets/images/doctorImg.png'),
                                              fit: BoxFit.cover,
                                            ),
                                            borderRadius:
                                                const BorderRadius.all(
                                                    Radius.circular(50.0)),
                                            border: Border.all(
                                              color: const Color(0xff21D59B),
                                              width: 2.0,
                                            ),
                                          ),
                                        ),
                                        const Text(
                                          'Dr.James',
                                          style: TextStyle(
                                            color: Color(0xff124164),
                                            fontSize: 14,
                                            fontFamily: 'Poppins',
                                            letterSpacing: .14,
                                          ),
                                        ),
                                        Container(
                                          width: 26.0,
                                          height: 26.0,
                                          decoration: BoxDecoration(
                                            color: const Color(0xff7c94b6),
                                            image: const DecorationImage(
                                              image: AssetImage(
                                                  'assets/images/doctor2Img.png'),
                                              fit: BoxFit.cover,
                                            ),
                                            borderRadius:
                                                const BorderRadius.all(
                                                    Radius.circular(50.0)),
                                            border: Border.all(
                                              color: const Color(0xff21D59B),
                                              width: 2.0,
                                            ),
                                          ),
                                        ),
                                        const Padding(
                                          padding: EdgeInsets.only(left: 8.0),
                                          child: Text(
                                            'Dr.James',
                                            style: TextStyle(
                                              color: Color(0xff124164),
                                              fontSize: 14,
                                              fontFamily: 'Poppins',
                                              letterSpacing: .14,
                                            ),
                                          ),
                                        ),
                                        const Padding(
                                          padding: EdgeInsets.only(left: 8.0),
                                          child: Text(
                                            '5 +',
                                            style: TextStyle(
                                              color: Color(0xff124164),
                                              fontSize: 14,
                                              fontFamily: 'Poppins',
                                              letterSpacing: .14,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const ImageIcon(
                                AssetImage('assets/images/icon_arrow.png'))
                          ],
                        ),
                      ),
                    ),
                  );
                }),
          );
        }
        if (state is SurgeryListErrorState) {
          return const Center(
            child: Text("Error"),
          );
        }
        return Container();
      }),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:phms_project_mobile/store/bloc/doctor_card_details_bloc/doctor_card_details_bloc.dart';

import '../../../models/doctor_card_details_model.dart';
import '../../../services/doctor_card_details/doctor_card_details_service.dart';
import '../../../store/bloc/doctor_card_details_bloc/doctor_card_details_event.dart';
import '../../../store/bloc/doctor_card_details_bloc/doctor_card_details_state.dart';

class DoctorDeatailsCardWidget extends StatelessWidget {
  const DoctorDeatailsCardWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => DoctorCardDetailsBloc(
        DoctorCardRepository(),
      )..add(LoadCardEvent()),
      child: BlocBuilder<DoctorCardDetailsBloc, DoctorCardDetailsState>(
          builder: (context, state) {
        if (state is CardLoadingState) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        if (state is CardLoadedState) {
          List<DoctorCardDetailsModel> doctorCardList = state.doctorDetails;
          return SizedBox(
            height: 180,
            width: MediaQuery.of(context).size.width * .97,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                itemCount: doctorCardList.length,
                itemBuilder: (_, index) {
                  return Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    elevation: 4,
                    child: Padding(
                      padding: const EdgeInsets.all(13),
                      child: InkWell(
                        onTap: () {},
                        child: Container(
                          width: MediaQuery.of(context).size.width * .84,
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  const Image(
                                    width: 92,
                                    height: 87,
                                    image: AssetImage(
                                        'assets/images/doctor2Img.png'),
                                  ),
                                  Container(
                                    margin: const EdgeInsets.only(left: 10),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          doctorCardList[index].name,
                                          style: const TextStyle(
                                              color: Color(0xff134469),
                                              fontSize: 18,
                                              fontFamily: 'Poppins',
                                              letterSpacing: 1.0,
                                              fontWeight: FontWeight.w600),
                                        ),
                                        const SizedBox(
                                          height: 3,
                                        ),
                                        Text(doctorCardList[index].specialized,
                                            style: const TextStyle(
                                                color: Color(0xff134469),
                                                fontSize: 13,
                                                fontFamily: 'Poppins',
                                                fontWeight: FontWeight.w400)),
                                        const SizedBox(
                                          height: 3,
                                        ),
                                        Text(
                                            '${doctorCardList[index].experience} Years',
                                            style: const TextStyle(
                                                color: Color(0xff134469),
                                                fontSize: 12,
                                                fontFamily: 'Poppins',
                                                fontWeight: FontWeight.w400)),
                                        const SizedBox(
                                          height: 6,
                                        ),
                                        Row(
                                          children: [
                                            Container(
                                              width: 10,
                                              height: 10,
                                              decoration: const BoxDecoration(
                                                shape: BoxShape.circle,
                                                color: Color(0xff0EBE7F),
                                              ),
                                            ),
                                            Container(
                                                margin:
                                                    const EdgeInsets.symmetric(
                                                        horizontal: 5),
                                                child: const Text('87%',
                                                    style: TextStyle(
                                                        color:
                                                            Color(0xff134469),
                                                        fontSize: 11,
                                                        fontFamily: 'Poppins',
                                                        fontWeight:
                                                            FontWeight.w400))),
                                            Container(
                                                margin:
                                                    const EdgeInsets.symmetric(
                                                        horizontal: 10),
                                                width: 10,
                                                height: 10,
                                                decoration: const BoxDecoration(
                                                  shape: BoxShape.circle,
                                                  color: Color(0xff0EBE7F),
                                                )),
                                            Container(
                                                child: Text(
                                                    '${doctorCardList[index].patientCount} Patient',
                                                    style: const TextStyle(
                                                        color:
                                                            Color(0xff134469),
                                                        fontSize: 12,
                                                        fontFamily: 'Poppins',
                                                        fontWeight:
                                                            FontWeight.w400)))
                                          ],
                                        )
                                      ],
                                    ),
                                  )
                                ],
                              ),
                              Container(
                                padding: const EdgeInsets.all(5),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Column(
                                      children: [
                                        ElevatedButton(
                                            style: ElevatedButton.styleFrom(
                                                backgroundColor:
                                                    const Color(0xffFFBE00)),
                                            onPressed: () {
                                              // _navigateToNextScreen(context);
                                            },
                                            child: const Text('Schedule')),
                                        // const Text('Next Available',
                                        //     style: TextStyle(
                                        //         color: Color(0xff134469),
                                        //         fontSize: 13,
                                        //         fontFamily: 'Poppins',
                                        //         fontWeight: FontWeight.w600)),
                                        // Row(
                                        // children: const [
                                        //   Text('10:00 AM',
                                        //       style: TextStyle(
                                        //           color: Color(0xff134469),
                                        //           fontSize: 12,
                                        //           fontFamily: 'Poppins',
                                        //           fontWeight:
                                        //               FontWeight.w600)),
                                        // Text('AM tommorrow',
                                        //     style: TextStyle(
                                        //         color: Color(0xff134469),
                                        //         fontSize: 12,
                                        //         fontFamily: 'Poppins',
                                        //         fontWeight: FontWeight.w400)),
                                        // ],
                                        // ),
                                      ],
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                }),
          );
        }
        if (state is CardErrorState) {
          return const Center(
            child: Text("Error"),
          );
        }
        return Container();
      }),
    );
  }

  // void _navigateToNextScreen(BuildContext context) {
  //   Navigator.of(context).push(
  //       MaterialPageRoute(builder: (context) => const CreateSurgeryPlan()));
  // }
}

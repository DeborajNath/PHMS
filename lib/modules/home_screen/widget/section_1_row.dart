import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../models/user_details_model.dart';
import '../../../services/user_details/user_details_service.dart';
import '../../../store/user_details_bloc/user_details_bloc.dart';
import '../../../store/user_details_bloc/user_details_event.dart';
import '../../../store/user_details_bloc/user_details_state.dart';

class Section1Row extends StatelessWidget {
  const Section1Row({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => UserDetailsBloc(
        UserRepository(),
      )..add(LoadUserEvent()),
      child: BlocBuilder<UserDetailsBloc, UserDetailsState>(
          builder: (context, state) {
        if (state is UserLoadingState) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        if (state is UserLoadedState) {
          UserDetailsModel userList = state.users;
          return Container(
            color: Colors.white,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 62,
                  width: 62,
                  margin: const EdgeInsets.only(left: 20),
                  child: CircleAvatar(
                    backgroundImage:
                        NetworkImage(userList.profilePicUrl.toString()),
                  ),
                ),
                Expanded(
                  child: Container(
                    margin: const EdgeInsets.only(left: 20),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Welcome back !',
                              style: TextStyle(
                                  color: Color(0xff1A1A1A),
                                  fontSize: 14,
                                  fontFamily: 'Poppins',
                                  letterSpacing: 1.0,
                                  fontWeight: FontWeight.w400),
                            ),
                            Row(
                              children: [
                                const Text(
                                  'Hi, ',
                                  style: TextStyle(
                                      color: Color(0xff1A1A1A),
                                      fontSize: 14,
                                      fontFamily: 'Poppins',
                                      letterSpacing: 1.0,
                                      fontWeight: FontWeight.w700),
                                ),
                                Text(
                                  '${userList.firstName} ${userList.lastName}',
                                  style: const TextStyle(
                                      color: Color(0xff1A1A1A),
                                      fontSize: 14,
                                      fontFamily: 'Poppins',
                                      letterSpacing: 1.0,
                                      fontWeight: FontWeight.w700),
                                )
                              ],
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                // Container(
                //     margin: const EdgeInsets.only(right: 22),
                //     width: 32,
                //     height: 24,
                //     child: const ImageIcon(
                //         AssetImage('assets/images/scanner.png')))
              ],
            ),
          );
        }
        if (state is UserErrorState) {
          return const Center(
            child: Text("Error"),
          );
        }
        return Container();
      }),
    );
  }
}

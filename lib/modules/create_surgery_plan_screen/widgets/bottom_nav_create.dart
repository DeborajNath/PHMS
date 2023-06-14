import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:phms_project_mobile/modules/common_widget/bottom_nav_main.dart';
import 'package:phms_project_mobile/store/bloc/create_surgery_bloc/create_surgery_state.dart';
import '../../../store/bloc/create_surgery_bloc/create_surgery_bloc.dart';
import '../../../store/bloc/create_surgery_bloc/create_surgery_event.dart';

class BottomNavCreateSurgery extends StatelessWidget {
  final formKey;
  const BottomNavCreateSurgery({super.key, required this.formKey});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: MaterialButton(
            height: 50,
            color: const Color.fromRGBO(234, 165, 37, 1),
            minWidth: MediaQuery.of(context).size.width * 0.9,
            onPressed: () {
              if (formKey.currentState!.validate()) {
                context.read<CreateSurgeryBloc>().add(CreateSurgery());

               
              } else {
                if (kDebugMode) {
                  print("error");
                }
              }
            },
            child: BlocConsumer<CreateSurgeryBloc, CreateSurgeryState>(
              builder: (context, state) {
                
              if(state is CreatingSurgery)
              {
                return const SizedBox(height: 22, width: 22,
                child: CupertinoActivityIndicator());
              }
              else{
              return const Text(
                "Create",
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              )
              ;}
            },listener: (context, state) {
              if(state is SurgeryCreated){
                 Navigator.pushReplacement(context,MaterialPageRoute(
                  builder: (context) => const BottomNavMainScreen(screenIndex: 1,)),);
              }
            },   )),
      ),
    );
  }
}

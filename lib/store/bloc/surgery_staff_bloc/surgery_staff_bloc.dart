import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:phms_project_mobile/store/bloc/surgery_staff_bloc/surgery_staff_event.dart';
import 'package:phms_project_mobile/store/bloc/surgery_staff_bloc/surgery_staff_state.dart';

import '../../../models/surgery_staff_model.dart';
import '../../../services/repository.dart';

class SurgeryStaffBloc extends Bloc<SurgeryStaffEvent, SurgeryStaffState> {
  DateTime? selectedDate = DateTime.now();
  String? time = "08:00 AM";
  SurgeryStaffBloc() : super(SurgeryStaffInitialState()) {
    on<GetStaffDetailsEvent>(getStaffDetailsEvent);
  }

  Future<FutureOr<void>> getStaffDetailsEvent(
      GetStaffDetailsEvent event, Emitter<SurgeryStaffState> emit) async {
    emit(LoadingSurgeryStaff());
    List<SurgeryStaffModel> staffModel;
    // var url= '/api/hospital/63e4ab65d7385e272a806760/staff/available?dateTime=${selectedDate.toString().split(" ").first}T${time!.split(" ").first}';
    var url =
        '/api/hospital/6435480738070b4ad671ce1c/staff/available?dateTime=${selectedDate.toString().split(" ").first}T${time!.split(" ").first}:00';
    if (kDebugMode) {
      print(url);
    }
    try {
      staffModel = await Repository().getStaffDetails(url: url);

      // if (staffModel.status == false) {
      //   emit(SurgeryStaffError());
      // } else {
      emit(SurgeryStaffSuccess(staffModel));
      //}
    } catch (e) {
      emit(SurgeryStaffError());
    }
  }
}

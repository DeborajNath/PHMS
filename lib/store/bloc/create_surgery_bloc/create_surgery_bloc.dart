import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';
import 'package:phms_project_mobile/services/repository.dart';
import 'package:phms_project_mobile/store/bloc/create_surgery_bloc/create_surgery_event.dart';
import 'package:phms_project_mobile/store/bloc/create_surgery_bloc/create_surgery_state.dart';

import '../../../models/create_surgery_model.dart';

class CreateSurgeryBloc extends Bloc<CreateSurgeryEvent, CreateSurgeryState> {
  Map data = {
    "name": "Hello world",
    "type": "test",
    "cost": 25000,
    "email": "asterstaff@testmail.com",
    "surgeryDate": "",
    "dateTime": "",
    "staff": [],
    "patientName": "",
    "patientContact": "",
    "notes": "",
    "surgeryType": "",
    "room": ""
  };
  CreateSurgeryBloc() : super(CreateSurgeryInitialState()) {
    on<CreateSurgery>(createSurgery);
  }

  Future<FutureOr<void>> createSurgery(
      event, Emitter<CreateSurgeryState> emit) async {
    emit(CreatingSurgery());
    try {
      if (data["surgeryType"] == "") {
        Fluttertoast.showToast(msg: 'Enter Surgery Type');
      } else if (data["staff"].isEmpty) {
        Fluttertoast.showToast(msg: 'Choose Surgeons');
      } else if (data["room"] == "") {
        Fluttertoast.showToast(msg: 'Select Surgery Room');
      } else {
        data["dateTime"] = formatDate(DateTime.now());

        log(data.toString());
        CreateSurgeryModel createSurgeryModel = await Repository()
            .createSurgery(
                url: '/api/hospital/6435480738070b4ad671ce1c/surgery/save',
                data: data);
        emit(SurgeryCreated());
        Fluttertoast.showToast(
            msg: 'Surgery Created', backgroundColor: Colors.green);
      }
    } catch (e) {
      emit(SurgeryCreationError());
      Fluttertoast.showToast(
          msg: 'Something went wrong', backgroundColor: Colors.redAccent);
    }
  }

  String formatDate(DateTime dateTime) {
    String formattedDateTime =
        DateFormat('yyyy-MM-ddTHH:mm:ss').format(dateTime);
    return formattedDateTime;
  }
}

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:phms_project_mobile/models/doctor_card_details_model.dart';

@immutable
abstract class DoctorCardDetailsState extends Equatable {}

//data loading state
class CardLoadingState extends DoctorCardDetailsState {
  @override
  List<Object?> get props => [];
}

class CardLoadedState extends DoctorCardDetailsState {
  final List<DoctorCardDetailsModel> doctorDetails;
  CardLoadedState(this.doctorDetails);
  @override
  List<Object?> get props => [doctorDetails];
}

class CardErrorState extends DoctorCardDetailsState {
  final String error;
  CardErrorState(this.error);
  @override
  List<Object?> get props => [error];
}

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import '../../../models/surgery_list_details_model.dart';

@immutable
abstract class SurgeryListDetailsState extends Equatable {}

//data loading state
class SurgeryListLoadingState extends SurgeryListDetailsState {
  @override
  List<Object?> get props => [];
}

class SurgeryListLoadedState extends SurgeryListDetailsState {
  final List<SurgeryListDetailsModel> surgeryListDetails;
  SurgeryListLoadedState(this.surgeryListDetails);
  @override
  List<Object?> get props => [surgeryListDetails];
}

class SurgeryListErrorState extends SurgeryListDetailsState {
  final String error;
  SurgeryListErrorState(this.error);
  @override
  List<Object?> get props => [error];
}

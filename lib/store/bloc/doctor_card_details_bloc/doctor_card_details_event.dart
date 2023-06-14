import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

@immutable
abstract class DoctorCardDetailsEvent extends Equatable {
  const DoctorCardDetailsEvent();
}

class LoadCardEvent extends DoctorCardDetailsEvent {
  @override
  List<Object?> get props => [];
}

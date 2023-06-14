import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

@immutable
abstract class SurgeryListDetailsEvent extends Equatable {
  const SurgeryListDetailsEvent();
}

class LoadSurgeryListEvent extends SurgeryListDetailsEvent {
  @override
  List<Object?> get props => [];
}

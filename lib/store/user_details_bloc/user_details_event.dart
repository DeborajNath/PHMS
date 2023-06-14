import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

@immutable
abstract class UserDetailsEvent extends Equatable {
  const UserDetailsEvent();
}

class LoadUserEvent extends UserDetailsEvent {
  @override
  List<Object?> get props => [];
}

// class UserDetailsEvent {}

// class GetUserDetailsEvent extends UserDetailsEvent {}

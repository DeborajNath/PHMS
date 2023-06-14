import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import '../../../models/user_details_model.dart';

@immutable
abstract class UserDetailsState extends Equatable {}

//data loading state
class UserLoadingState extends UserDetailsState {
  @override
  List<Object?> get props => [];
}

class UserLoadedState extends UserDetailsState {
  final UserDetailsModel users;
  UserLoadedState(this.users);
  @override
  List<Object?> get props => [users];
}

class UserErrorState extends UserDetailsState {
  final String error;
  UserErrorState(this.error);
  @override
  List<Object?> get props => [error];
}

// import '../../models/user_details_model.dart';

// class UserDetailsState {}

// class UserDetailsInitialState extends UserDetailsState {}

// class LoadingUserDetails extends UserDetailsState {}

// class UserDetailsError extends UserDetailsState {}

// class UserDetailsSuccess extends UserDetailsState {
//   final List<UserDetailsModel> UserDetailsModel;

//   UserDetailsSuccess(this.UserDetailsModel);
// }

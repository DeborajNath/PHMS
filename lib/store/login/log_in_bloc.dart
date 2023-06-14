import 'dart:developer';

import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:formz/formz.dart ';

import '../../services/login/login.dart';
 
part 'log_in_event.dart';
part 'log_in_state.dart';
part 'log_in_bloc.freezed.dart';

class LogInBloc extends Bloc<LoginRequested, LogInState> {
  // final AuthService authService;

  LogInBloc() : super(LogInState.initial()) {
    on<LoginRequested>((event, emit) async{


      AuthService service = AuthService();

      final  username= await event.username;
      final password= await event.password;
      final context=await event.context;

      log('entered authentication $username $password ');
      var  _result =await service.login(context,username,password);
      log('message $_result');
      
      emit(_$_Success());
    });
  }
}

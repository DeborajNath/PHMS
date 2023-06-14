part of 'log_in_bloc.dart';

class LogInEvent extends Equatable {
  const LogInEvent();

  @override
  List<Object?> get props => [];
}

class LoginRequested extends LogInEvent {
  final String username;
  final String password;
  final BuildContext context;
  

  const LoginRequested( {required this.context,required this.username, required this.password});


  @override
  String toString()=>'login button pressed username :$username $password';

  @override
  List<Object?> get props => [username, password];
}

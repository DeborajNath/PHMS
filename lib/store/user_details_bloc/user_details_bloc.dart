import 'package:flutter_bloc/flutter_bloc.dart';
import '../../services/user_details/user_details_service.dart';
import '../../store/user_details_bloc/user_details_event.dart';
import '../../store/user_details_bloc/user_details_state.dart';

class UserDetailsBloc extends Bloc<UserDetailsEvent, UserDetailsState> {
  final UserRepository _userRepository;

  UserDetailsBloc(this._userRepository) : super(UserLoadingState()) {
    on<LoadUserEvent>((event, emit) async {
      emit(UserLoadingState());
      try {
        final users = await _userRepository.getUsers();
        emit(UserLoadedState(users));
      } catch (e) {
        emit(UserErrorState(e.toString()));
      }
    });
  }
}

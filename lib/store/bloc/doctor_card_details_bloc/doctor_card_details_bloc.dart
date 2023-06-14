import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../services/doctor_card_details/doctor_card_details_service.dart';
import 'doctor_card_details_event.dart';
import 'doctor_card_details_state.dart';

class DoctorCardDetailsBloc
    extends Bloc<DoctorCardDetailsEvent, DoctorCardDetailsState> {
  final DoctorCardRepository _doctorCardRepository;

  DoctorCardDetailsBloc(this._doctorCardRepository)
      : super(CardLoadingState()) {
    on<LoadCardEvent>((event, emit) async {
      emit(CardLoadingState());
      try {
        final doctorDetails = await _doctorCardRepository.getCardDetails();
        emit(CardLoadedState(doctorDetails));
      } catch (e) {
        emit(CardErrorState(e.toString()));
      }
    });
  }
}

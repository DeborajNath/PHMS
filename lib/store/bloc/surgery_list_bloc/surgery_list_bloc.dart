import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../services/surgery_list_details/surgery_list_details_service.dart';
import 'surgery_list_event.dart';
import 'surgery_list_state.dart';

class SurgeryListDetailsBloc
    extends Bloc<SurgeryListDetailsEvent, SurgeryListDetailsState> {
  final SurgeryListRepository _surgeryListRepository;

  SurgeryListDetailsBloc(this._surgeryListRepository)
      : super(SurgeryListLoadingState()) {
    on<LoadSurgeryListEvent>((event, emit) async {
      emit(SurgeryListLoadingState());
      try {
        final doctorDetails =
            await _surgeryListRepository.getSurgeryListDetails();
        emit(SurgeryListLoadedState(doctorDetails));
      } catch (e) {
        emit(SurgeryListErrorState(e.toString()));
      }
    });
  }
}

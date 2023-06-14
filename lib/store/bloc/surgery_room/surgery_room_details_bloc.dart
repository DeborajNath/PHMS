import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:phms_project_mobile/store/bloc/surgery_room/surgery_room_details_event.dart';
import 'package:phms_project_mobile/store/bloc/surgery_room/surgery_room_details_state.dart';

import '../../../models/surgery_rooms_details.dart';
import '../../../services/repository.dart';

class SurgeryRoomBloc extends Bloc<SurgeryRoomEvent, SurgeryRoomState> {
  SurgeryRoomBloc() : super(SurgeryRoomInitialState()) {
    on<GetAllRooms>(getAllRooms);
  }

  Future<FutureOr<void>> getAllRooms(
      GetAllRooms event, Emitter<SurgeryRoomState> emit) async {
    emit(FetchingSurgeryRooms());
    try {
      SurgeryRoomModel surgeryRoomModel = await Repository()
          .getSurgeryRooms(url: '/api/hospital/6435480738070b4ad671ce1c/view');
      emit(SurgeryRoomsFetched(surgeryRoomModel: surgeryRoomModel));
    } catch (e) {
      emit(SurgeryRoomsError());
    }
  }
}

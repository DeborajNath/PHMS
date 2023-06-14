
import 'package:phms_project_mobile/models/surgery_rooms_details.dart';

class SurgeryRoomState {}
class SurgeryRoomInitialState extends SurgeryRoomState{}
class FetchingSurgeryRooms extends SurgeryRoomState{}
class SurgeryRoomsFetched extends SurgeryRoomState{
  final SurgeryRoomModel? surgeryRoomModel;

  SurgeryRoomsFetched({this.surgeryRoomModel});
}
class SurgeryRoomsError extends SurgeryRoomState{}
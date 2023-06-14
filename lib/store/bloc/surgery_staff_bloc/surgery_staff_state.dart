
import '../../../models/surgery_staff_model.dart';

class SurgeryStaffState{}
class SurgeryStaffInitialState extends SurgeryStaffState {}
class LoadingSurgeryStaff extends SurgeryStaffState {}
class SurgeryStaffError extends SurgeryStaffState {}
class SurgeryStaffSuccess extends SurgeryStaffState {
  
  final List<SurgeryStaffModel> surgerystaffmodel;

  SurgeryStaffSuccess(this.surgerystaffmodel);
  }

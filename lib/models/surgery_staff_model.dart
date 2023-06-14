class SurgeryStaffModel {
  String? id;
  String? hospitalId;
  String? name;
  bool? active=false;
  String? type;
  String? specialiazed;
  int? experience;
  int? patientCount;
  DoctorAvailability? doctorAvailability;

  SurgeryStaffModel(
      {this.id,
      this.hospitalId,
      this.name,
      this.type,
      this.specialiazed,
      this.experience,
      this.patientCount,
      this.doctorAvailability});

  SurgeryStaffModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    hospitalId = json['hospitalId'];
    name = json['name'];
    type = json['type'];
    specialiazed = json['specialiazed'];
    experience = json['experience'];
    patientCount = json['patientCount'];
    // doctorAvailability = json['doctorAvailability'] != null
    //     ? new DoctorAvailability.fromJson(json['doctorAvailability'])
    //     : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['hospitalId'] = this.hospitalId;
    data['name'] = this.name;
    data['type'] = this.type;
    data['specialiazed'] = this.specialiazed;
    data['experience'] = this.experience;
    data['patientCount'] = this.patientCount;
    if (this.doctorAvailability != null) {
      data['doctorAvailability'] = this.doctorAvailability!.toJson();
    }
    return data;
  }
}

class DoctorAvailability {
  Null? friday;
  Null? saturday;
  Null? wednesday;
  Null? sunday;
  Null? thursday;
  Null? tuesday;
  Null? monday;

  DoctorAvailability(
      {this.friday,
      this.saturday,
      this.wednesday,
      this.sunday,
      this.thursday,
      this.tuesday,
      this.monday});

  DoctorAvailability.fromJson(Map<String, dynamic> json) {
    friday = json['friday'];
    saturday = json['saturday'];
    wednesday = json['wednesday'];
    sunday = json['sunday'];
    thursday = json['thursday'];
    tuesday = json['tuesday'];
    monday = json['monday'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['friday'] = this.friday;
    data['saturday'] = this.saturday;
    data['wednesday'] = this.wednesday;
    data['sunday'] = this.sunday;
    data['thursday'] = this.thursday;
    data['tuesday'] = this.tuesday;
    data['monday'] = this.monday;
    return data;
  }
}

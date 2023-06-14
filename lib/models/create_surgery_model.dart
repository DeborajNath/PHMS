class CreateSurgeryModel {
  Data? data;
  String? message;

  CreateSurgeryModel({this.data, this.message});

  CreateSurgeryModel.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    data['message'] = message;
    return data;
  }
}

class Data {
  String? id;
  String? hospitalId;
  String? name;
  String? type;
  int? cost;
  String? email;
  List<Staff>? staff;
  List<int>? dateTime;
  List<int>? surgeryDate;
  String? patientName;
  String? patientContact;
  String? notes;
  String? surgeryType;
  String? room;

  Data(
      {this.id,
      this.hospitalId,
      this.name,
      this.type,
      this.cost,
      this.email,
      this.staff,
      this.dateTime,
      this.surgeryDate,
      this.patientName,
      this.patientContact,
      this.notes,
      this.surgeryType,
      this.room});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    hospitalId = json['hospitalId'];
    name = json['name'];
    type = json['type'];
    cost = json['cost'];
    email = json['email'];
    if (json['staff'] != null) {
      staff = <Staff>[];
      json['staff'].forEach((v) {
        staff!.add(Staff.fromJson(v));
      });
    }
    dateTime = json['dateTime'].cast<int>();
    surgeryDate = json['surgeryDate'].cast<int>();
    patientName = json['patientName'];
    patientContact = json['patientContact'];
    notes = json['notes'];
    surgeryType = json['surgeryType'];
    room = json['room'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['hospitalId'] = hospitalId;
    data['name'] = name;
    data['type'] = type;
    data['cost'] = cost;
    data['email'] = email;
    if (staff != null) {
      data['staff'] = staff!.map((v) => v.toJson()).toList();
    }
    data['dateTime'] = dateTime;
    data['surgeryDate'] = surgeryDate;
    data['patientName'] = patientName;
    data['patientContact'] = patientContact;
    data['notes'] = notes;
    data['surgeryType'] = surgeryType;
    data['room'] = room;
    return data;
  }
}

class Staff {
  String? id;
  String? hospitalId;
  String? name;
  String? type;
  String? specialized;
  int? experience;
  int? patientCount;
  List<List>? surgeryAssignedDates;

  Staff(
      {this.id,
      this.hospitalId,
      this.name,
      this.type,
      this.specialized,
      this.experience,
      this.patientCount,
      this.surgeryAssignedDates});

  Staff.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    hospitalId = json['hospitalId'];
    name = json['name'];
    type = json['type'];
    specialized = json['specialized'];
    experience = json['experience'];
    patientCount = json['patientCount'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['hospitalId'] = hospitalId;
    data['name'] = name;
    data['type'] = type;
    data['specialized'] = specialized;
    data['experience'] = experience;
    data['patientCount'] = patientCount;

    return data;
  }
}

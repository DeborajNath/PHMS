class SurgeryRoomModel {
  String? id;
  String? name;
  String? code;
  List<String>? surgeryTypes;
  List<String>? surgeryRooms;


  SurgeryRoomModel(
      {this.id,
      this.name,
      this.code,
      this.surgeryTypes,
      this.surgeryRooms,
    });

  SurgeryRoomModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    code = json['code'];
    surgeryTypes = json['surgeryTypes'].cast<String>();
    surgeryRooms = json['surgeryRooms'].cast<String>();
  
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['code'] = code;
    data['surgeryTypes'] = surgeryTypes;
    data['surgeryRooms'] = surgeryRooms;
    return data;
  }
}

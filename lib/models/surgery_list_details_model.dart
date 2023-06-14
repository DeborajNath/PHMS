class SurgeryListDetailsModel {
  String id;
  String hospitalId;
  String name;
  String type;
  String specialized;
  int experience;
  int patientCount;
  SurgeryListDetailsModel({
    required this.id,
    required this.hospitalId,
    required this.name,
    required this.type,
    required this.specialized,
    required this.experience,
    required this.patientCount,
  });
  factory SurgeryListDetailsModel.fromJson(Map<String, dynamic> json) {
    return SurgeryListDetailsModel(
      id: json['id'],
      hospitalId: json['hospitalId'],
      name: json['name'],
      type: json['type'] ?? 'NA',
      specialized: json['specialized'],
      experience: json['experience'],
      patientCount: json['patientCount'],
    );
  }
}

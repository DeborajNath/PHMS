class UserDetailsModel {
  String id;
  String username;
  String email;
  bool active;
  List<String> roles;
  String firstName;
  String lastName;
  String profilePicUrl;
  List<String> hospitalIds;
  UserDetailsModel({
    required this.id,
    required this.username,
    required this.email,
    required this.active,
    required this.roles,
    required this.firstName,
    required this.lastName,
    required this.profilePicUrl,
    required this.hospitalIds,
  });
  factory UserDetailsModel.fromJson(Map<String, dynamic> json) {
    return UserDetailsModel(
      id: json['id'],
      username: json['username'],
      email: json['email'],
      active: json['active'],
      roles: List<String>.from(json['roles']),
      firstName: json['firstName'],
      lastName: json['lastName'],
      profilePicUrl: json['profilePicUrl'],
      hospitalIds: List<String>.from(json['hospitalIds']),
    );
  }
}

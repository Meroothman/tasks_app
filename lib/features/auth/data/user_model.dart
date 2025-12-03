import 'dart:convert';

class UserModel {
  String firstName;
  String lastName;
  String email;
  String phone;
  String password;
  String? profileImagePath; 

  UserModel({
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.phone,
    required this.password,
    this.profileImagePath,
  });

  Map<String, dynamic> toJson() {
    return {
      "firstName": firstName,
      "lastName": lastName,
      "email": email,
      "phone": phone,
      "password": password,
      "profileImagePath": profileImagePath,
    };
  }

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      firstName: json["firstName"],
      lastName: json["lastName"],
      email: json["email"],
      phone: json["phone"],
      password: json["password"],
      profileImagePath: json["profileImagePath"],
    );
  }

  static UserModel fromJsonString(String jsonString) =>
      UserModel.fromJson(jsonDecode(jsonString));

  String toJsonString() => jsonEncode(toJson());

  // دالة copyWith للمساعدة في التحديث
  UserModel copyWith({
    String? firstName,
    String? lastName,
    String? email,
    String? phone,
    String? password,
    String? profileImagePath,
  }) {
    return UserModel(
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      email: email ?? this.email,
      phone: phone ?? this.phone,
      password: password ?? this.password,
      profileImagePath: profileImagePath ?? this.profileImagePath,
    );
  }
}
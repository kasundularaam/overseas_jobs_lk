import 'dart:convert';

import 'company_details.dart';

class HRM {
  final String id;
  final String name;
  final String email;
  final String password;
  final CompanyDetails companyDetails;
  final int userType;
  HRM({
    required this.id,
    required this.name,
    required this.email,
    required this.password,
    required this.companyDetails,
    required this.userType,
  });

  HRM copyWith({
    String? id,
    String? name,
    String? email,
    String? password,
    CompanyDetails? companyDetails,
    int? userType,
  }) {
    return HRM(
      id: id ?? this.id,
      name: name ?? this.name,
      email: email ?? this.email,
      password: password ?? this.password,
      companyDetails: companyDetails ?? this.companyDetails,
      userType: userType ?? this.userType,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'password': password,
      'companyDetails': companyDetails.toMap(),
      'userType': userType,
    };
  }

  factory HRM.fromMap(Map<String, dynamic> map) {
    return HRM(
      id: map['id'] ?? '',
      name: map['name'] ?? '',
      email: map['email'] ?? '',
      password: map['password'] ?? '',
      companyDetails: map['companyDetails'] != null
          ? CompanyDetails.fromMap(map['companyDetails'])
          : CompanyDetails(
              companyName: "companyName",
              companyAddress: "companyAddress",
              emai: "emai",
              password: "password"),
      userType: map['userType']?.toInt() ?? 0,
    );
  }

  String toJson() => json.encode(toMap());

  factory HRM.fromJson(String source) => HRM.fromMap(json.decode(source));

  @override
  String toString() {
    return 'HRM(id: $id, name: $name, email: $email, password: $password, companyDetails: $companyDetails, userType: $userType)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is HRM &&
        other.id == id &&
        other.name == name &&
        other.email == email &&
        other.password == password &&
        other.companyDetails == companyDetails &&
        other.userType == userType;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        name.hashCode ^
        email.hashCode ^
        password.hashCode ^
        companyDetails.hashCode ^
        userType.hashCode;
  }
}

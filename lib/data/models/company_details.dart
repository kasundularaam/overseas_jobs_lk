import 'dart:convert';

class CompanyDetails {
  final String companyName;
  final String companyAddress;
  final String emai;
  final String password;
  CompanyDetails({
    required this.companyName,
    required this.companyAddress,
    required this.emai,
    required this.password,
  });

  CompanyDetails copyWith({
    String? companyName,
    String? companyAddress,
    String? emai,
    String? password,
  }) {
    return CompanyDetails(
      companyName: companyName ?? this.companyName,
      companyAddress: companyAddress ?? this.companyAddress,
      emai: emai ?? this.emai,
      password: password ?? this.password,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'companyName': companyName,
      'companyAddress': companyAddress,
      'emai': emai,
      'password': password,
    };
  }

  factory CompanyDetails.fromMap(Map<String, dynamic> map) {
    return CompanyDetails(
      companyName: map['companyName'] ?? '',
      companyAddress: map['companyAddress'] ?? '',
      emai: map['emai'] ?? '',
      password: map['password'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory CompanyDetails.fromJson(String source) =>
      CompanyDetails.fromMap(json.decode(source));

  @override
  String toString() {
    return 'CompanyDetails(companyName: $companyName, companyAddress: $companyAddress, emai: $emai, password: $password)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is CompanyDetails &&
        other.companyName == companyName &&
        other.companyAddress == companyAddress &&
        other.emai == emai &&
        other.password == password;
  }

  @override
  int get hashCode {
    return companyName.hashCode ^
        companyAddress.hashCode ^
        emai.hashCode ^
        password.hashCode;
  }
}
